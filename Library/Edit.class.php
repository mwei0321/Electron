<?php
	/**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  编辑器
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: ONLY <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2014-9-18
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpyrb.com
	*  +----------------------------------------------------------------------------------------------+
	**/

	namespace Library;

	class Edit {

		//public $uid;//要操作的用户id 如有登录需要则去掉注释

		private $output;//要输出的数据
		private $st;
		//文件信息
		public $FileInfo = null;
		//文件上传定义
		public $RootPath = null;
		public $AbsPath = null;
		public $RelativePath = '/Uploads';
		public $ReceiveKey = 'file';//接收
		public $FileExe = null;//文件扩展名
		public $FileSize = 0;//文件扩展名
		public $fileName = '';//文件名
		public $MaxSize = '24657920';//最大文件大小,单位字节，默认20M
		public $FilterExe = ['gif','jpg','jpeg','bmp','png','swf','txt','xls','doc','xlsx','docx','zip','rar','7z'];


		public function __construct($uid = ''){
			//导入设置
			$CONFIG = json_decode(preg_replace("/\/\*[\s\S]+?\*\//", "", file_get_contents(CONF_PATH."editconfig.json")), true);

			$action = htmlspecialchars($_GET['action']);

			switch($action){
				case 'config':
					$result = json_encode($CONFIG);
					break;

				case 'uploadimage':
					$config = array(
					"pathFormat" => $CONFIG['imagePathFormat'],
					"maxSize" => $CONFIG['imageMaxSize'],
					"allowFiles" => $CONFIG['imageAllowFiles']
					);
					$fieldName = $CONFIG['imageFieldName'];
					$result = $this->uploadFile($config, $fieldName);
					break;

				case 'uploadscrawl':
					$config = array(
					"pathFormat" => $CONFIG['scrawlPathFormat'],
					"maxSize" => $CONFIG['scrawlMaxSize'],
					"allowFiles" => $CONFIG['scrawlAllowFiles'],
					"oriName" => "scrawl.png"
							);
							$fieldName = $CONFIG['scrawlFieldName'];
							$result=$this->uploadBase64($config,$fieldName);
							break;

				case 'uploadvideo':
					$config = array(
					"pathFormat" => $CONFIG['videoPathFormat'],
					"maxSize" => $CONFIG['videoMaxSize'],
					"allowFiles" => $CONFIG['videoAllowFiles']
					);
					$fieldName = $CONFIG['videoFieldName'];
					$result=$this->uploadFile($config, $fieldName);
					break;

				case 'uploadfile':
					// default:
					$config = array(
					"pathFormat" => $CONFIG['filePathFormat'],
					"maxSize" => $CONFIG['fileMaxSize'],
					"allowFiles" => $CONFIG['fileAllowFiles']
					);
					$fieldName = $CONFIG['fileFieldName'];
					$result=$this->uploadFile($config, $fieldName);
					break;

				case 'listfile':
					$config=array(
					'allowFiles' => $CONFIG['fileManagerAllowFiles'],
					'listSize' => $CONFIG['fileManagerListSize'],
					'path' => $CONFIG['fileManagerListPath'],
					);
					$result = $this->listFile($config);
					break;

				case 'listimage':
					$config=array(
					'allowFiles' => $CONFIG['imageManagerAllowFiles'],
					'listSize' => $CONFIG['imageManagerListSize'],
					'path' => $CONFIG['imageManagerListPath'],
					);
					$result = $this->listFile($config);
					break;

				case 'catchimage':
					$config = array(
					"pathFormat" => $CONFIG['catcherPathFormat'],
					"maxSize" => $CONFIG['catcherMaxSize'],
					"allowFiles" => $CONFIG['catcherAllowFiles'],
					"oriName" => "remote.png"
							);
							$fieldName = $CONFIG['catcherFieldName'];
							$result = $this->saveRemote($config , $fieldName);
							break;

				default:
					$result = json_encode(array(
					'state'=> 'wrong require'
							));
							break;

			}

			if (isset($_GET["callback"])) {
				if (preg_match("/^[\w_]+$/", $_GET["callback"])) {
					$this->output = htmlspecialchars($_GET["callback"]) . '(' . $result . ')';
				} else {
					$this->output = json_encode(array(
							'state'=> 'callback参数不合法'
					));
				}
			} else {
				$this->output = $result;
			}
		}


		/**
		 *
		 * 输出结果
		 * @param data 数组数据
		 * @return 组合后json格式的结果
		 */
		public function output(){
			return $this->output;
		}

		/**
		 * 上传文件方法
		 *
		 */
		private function uploadFile($config){
		    //网站根目录
		    $this->RootPath = $this->RootPath ??str_replace('\\', '/', dirname(dirname(__FILE__)));
		    //文件相对路径
		    $this->RelativePath = $this->getFullPath($config['pathFormat']);
		    //文件实际上传路径
		    $this->AbsPath = $this->RootPath.$this->RelativePath;
		    //创建目录
		    $this->_CreateDir($this->AbsPath);
		    //文件信息
            $fileInfo = $_FILES[$this->ReceiveKey];
            $this->FileExe = strtolower($this->getExt($fileInfo['name']));
            $this->FileSize = $fileInfo['size'];
            //返回数组定义
            $data = [];
            //判断文件大小
            if($this->FileSize > $this->MaxSize){
                $data['state']  = '文件限制20M';
                return json_encode($data);
            }
            //判断文件格式
            if(!in_array($this->FileExe,$this->FilterExe)){
                $data['state']  = '文件格式错误！';
                return json_encode($data);
            }
            //文件名
            $this->fileName = date('YmdHis').rand(10000,99999).'.'.$this->FileExe;
            $this->AbsPath .= $this->fileName;
            $this->RelativePath .= $this->fileName;
            //写入文件到指定目录
		    if(move_uploaded_file($fileInfo['tmp_name'], $this->AbsPath)) {
		        $data = [
		            'state'   =>  "SUCCESS",
		            'title'   => $this->fileName,
		            'original'=> $this->fileName,
		            'size'    => $this->FileSize,
		            'url'     => $this->RelativePath,
		            'path'    => $this->RelativePath,
		        ];
		    }else{
		        $data['state']    = '文件上传失败！';
		    }

		    return json_encode($data);
		}

		/**
		 * 写入文件
		 * @return array
		 * @author MaWei (http://www.phpython.com)
		 * @date 2017年3月3日 下午3:26:36
		**/
		function _wirteFile(){
		    $file = $_FILES[$this->ReceiveKey];

		    //创建目录
		    createDir($this->AbsPath);

		    if(!move_uploaded_file($file['tmp_name'], autoCharset($filename,'utf-8','gbk'))) {
		        return false;
		    }
		}

		/**
		 * 获取文件格式
		 * @param  string $_fileName
		 * @return array
		 * @author MaWei (http://www.phpython.com)
		 * @date 2017年3月6日 下午4:18:45
		**/
	    private function getExt($_fileName) {
            $pathinfo = pathinfo($_fileName);
            return $pathinfo['extension'];
        }

		/**
		 * 创建目录
		 * @param $_path
		 * @return array
		 * @author MaWei (http://www.phpython.com)
		 * @date 2017年3月3日 下午3:50:06
		**/
		private function _CreateDir($_path){
		    if (!file_exists($_path)){
		        $this->_CreateDir(dirname($_path));
		        @mkdir($_path, 0744);
		    }
		}

		/**
		* 把文件插入数据库
		* @param  array $_file
		* @return int　$reid
		* @author MaWei (http://www.phpyrb.com)
		* @date 2014-9-21  下午11:35:14
		*/
		function inputAttch($_file){
			$data = array();
			$data['name'] = $_file['name'];
			$data['size'] = $_file['size'];
			$data['path'] = $_file['savepath'].$_file['savename'];
			$data['type'] = in_array($_file['extension'],['jpg','png','bmp','jpeg','gif']) ? 1 : 2;
			$data['path'] = $_file['savepath'].$_file['savename'];
// 			$data['hash'] = $_file['hash'];
			$data['ctime'] = time();
			$reid = addupdata($data,'SourcAttach');
			return $reid;
		}

		/**
		 *
		 * Enter description here ...
		 */
		private function uploadBase64($config,$fieldName){
			$data = array();

			$base64Data = $_POST[$fieldName];
			$img = base64_decode($base64Data);
			$path = $this->getFullPath($config['pathFormat']);

			if(strlen($img)>$config['maxSize']){
				$data['states'] = 'too large';
				return json_encode($data);
			}

			$rootpath = $this->rootpath;

			//替换随机字符串
			$imgname = uniqid().'.png';
			$filename = $path.$imgname;

			if(\Vin\FileStorage::put($rootpath,$filename,$img)){
				$data=array(
						'state'=>'SUCCESS',
						'url'=>\Vin\FileStorage::getPath($rootpath,$filename),
						'title'=>$imgname,
						'original'=>'scrawl.png',
						'type'=>'.png',
						'size'=>strlen($img),

				);
			}else{
				$data=array(
						'state'=>'cant write',
				);
			}
			return json_encode($data);
		}

		/**
		 * 列出文件夹下所有文件，如果是目录则向下
		 */
		private function listFile($config){
			$allowFiles = substr(str_replace(".", "|", join("", $config['allowFiles'])), 1);
			$size = isset($_GET['size']) ? htmlspecialchars($_GET['size']) : $config['listSize'];
			$start = isset($_GET['start']) ? htmlspecialchars($_GET['start']) : 0;
			$end = $start + $size;

			$rootpath = $this->rootpath;

			$path = $config['path'];
			$files = \Vin\FileStorage::listFile($rootpath,$path, $allowFiles);
			//return $files;
			if (!count($files)) {
				return json_encode(array(
						"state" => "no match file",
						"list" => array(),
						"start" => $start,
						"total" => count($files)
				));
			}

			/* 获取指定范围的列表 */
			$len = count($files);
			for ($i = min($end, $len) - 1, $list = array(); $i < $len && $i >= 0 && $i >= $start; $i--){
				$list[] = $files[$i];
			}
			//倒序
			//for ($i = $end, $list = array(); $i < $len && $i < $end; $i++){
			//    $list[] = $files[$i];
			//}

			/* 返回数据 */
			$result = json_encode(array(
					"state" => "SUCCESS",
					"list" => $list,
					"start" => $start,
					"total" => count($files)
			));

			return $result;
		}

		/**
		 *
		 * Enter description here ...
		 */
		private function saveRemote($config , $fieldName){
			$list = array();
			if (isset($_POST[$fieldName])) {
				$source = $_POST[$fieldName];
			} else {
				$source = $_GET[$fieldName];
			}
			foreach ($source as $imgUrl) {
				$upload = new \Think\Upload();

				$imgUrl = htmlspecialchars($imgUrl);
				$imgUrl = str_replace("&amp;", "&", $imgUrl);

				//http开头验证
				if (strpos($imgUrl, "http") !== 0) {
					$data = array('state'=>'不是http链接');
					return json_encode($data);
				}
				//格式验证(扩展名验证和Content-Type验证)
				$fileType = strtolower(strrchr($imgUrl, '.'));
				if (!in_array($fileType, $config['allowFiles']) || stristr($heads['Content-Type'], "image")) {
					$data = array("state"=>"错误文件格式");
					return json_encode($data);
				}

				//打开输出缓冲区并获取远程图片
				ob_start();
				$context = stream_context_create(
						array('http' => array(
								'follow_location' => false // don't follow redirects
						))
				);
				readfile($imgUrl, false, $context);
				$img = ob_get_contents();
				ob_end_clean();
				preg_match("/[\/]([^\/]*)[\.]?[^\.\/]*$/", $imgUrl, $m);

				$path = $this->getFullPath($config['pathFormat']);
				if(strlen($img)>$config['maxSize']){
					$data['states'] = 'too large';
					return json_encode($data);
				}

				$rootpath = $this->rootpath;

				$imgname = uniqid().'.png';
				$filename = $path.$imgname;

				$oriName = $m ? $m[1]:"";

				if(\Vin\FileStorage::put($rootpath,$filename,$img)){
					array_push($list, array(
					"state" => 'SUCCESS',
					"url" => \vin\FileStorage::getPath($rootpath,$filename),
					"size" => strlen($img),
					"title" => $imgname,
					"original" => $oriName,
					"source" => htmlspecialchars($imgUrl)
					));
				}else{
					array_push($list,array('state'=>'文件写入失败'));
				}
			}

			/* 返回抓取数据 */
			return json_encode(array(
					'state'=> count($list) ? 'SUCCESS':'ERROR',
					'list'=> $list
			));
		}

		/**
		 * 规则替换命名文件
		 * @param $path
		 * @return string
		 */
	    private function getFullPath($_format){
	        //替换日期事件
	        $t = time();
	        $d = explode('-', date("Y-y-m-d-H-i-s"));
	        $format = $_format;
	        $format = str_replace("{yyyy}", $d[0], $format);
	        $format = str_replace("{yy}", $d[1], $format);
	        $format = str_replace("{mm}", $d[2], $format);
	        $format = str_replace("{dd}", $d[3], $format);
	        $format = str_replace("{hh}", $d[4], $format);
	        $format = str_replace("{ii}", $d[5], $format);
	        $format = str_replace("{ss}", $d[6], $format);
	        $format = str_replace("{time}", $t, $format);
	        return $format;
	    }

	    /**
	     * 获取文件扩展名
	     * @return string
	     */
	    private function getFileExt(){
	    	return strtolower(strrchr($this->oriName, '.'));
	    }

		private function format_exts($exts){
			$data=array();
			foreach ($exts as $key => $value) {
				$data[]=ltrim($value,'.');
			}
			return $data;
		}

	}