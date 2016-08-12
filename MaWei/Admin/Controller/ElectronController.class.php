<?php
   /**
	*  +---------------------------------------------------------------------------------+
	*   | Explain:  电子元件管理
	*  +---------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +---------------------------------------------------------------------------------+
	*   | Creater Time : 2016年6月2日
	*  +---------------------------------------------------------------------------------+
	*   | Link :		http://www.phpyrb.com
	*  +---------------------------------------------------------------------------------+
	**/
    namespace Admin\Controller;
    use Admin\Controller\InitController;
    use Library\Electron;
    use Vendor\Page;

	class ElectronController extends InitController{
        private $electron;

	    function _init(){
	        parent::_init();
	        $this->electron = new Electron();
	    }

	    /**
	     * 元件列表
	     * @return array
	     * @author MaWei (http://www.phpython.com)
	     * @date 2016年6月4日 下午1:05:51
	    */
	    function index(){

	        $count = $this->electron->getElectronList();
            if($count > 0){
                $page = new Page($count, 50);
                $list = $this->electron->getElectronList([],$page->firstRow.','.$page->listRows);
            }

            $this->assign('list',$list);
            $this->display();
	    }

	    /**
	     * 元件分类列表
	     * @return array
	     * @author MaWei (http://www.phpython.com)
	     * @date 2016年6月4日 下午1:06:31
	    */
	    function category(){
	        $list = $this->electron->getElectCate();

	        $this->assign('list',$list);
            $this->display();
	    }

	    /**
	     * 元件编辑
	     * @return array
	     * @author MaWei (http://www.phpython.com)
	     * @date 2016年6月4日 下午1:01:24
	    */
	    function edit(){
	        $cate = $this->electron->getElectCate();

	        $id = intval($_REQUEST['id']);
	        if($id > 0){
	            $info = $this->electron->getElectronInfo($id);
	            $this->assign('info',$info);
	        }

	        $this->assign('catelist',$cate);
            $this->display();
	    }

	    /**
	     * 元件套装编辑
	     * @return array
	     * @author MaWei (http://www.phpython.com)
	     * @date 2016年8月8日 上午10:38:28
	    */
	    function suitedit(){

	    }

	    /**
	     * 元件分类编辑
	     * @return array
	     * @author MaWei (http://www.phpython.com)
	     * @date 2016年6月4日 下午12:59:54
	    */
	    function cateeidt(){
	        $id = intval($_REQUEST['id']);
	        if($id > 0){
	            $info = $this->electron->getElectCate(['id'=>$id]);
	            $this->assign('info',array_shift($info));
	        }
            $this->display();
	    }

	    /**
	     * 分类、标签数据更新、添加
	     * @author MaWei (http://www.phpyrb.com)
	     * @date 2014-8-10  下午3:52:53
	     */
	    function addupdata(){
	        //数据
	        $data = array();
	        //表名
	        $model = null;
            //更新的类型
            $type = text($_REQUEST['type']);

	        $_REQUEST['id'] && $data['id'] = intval($_REQUEST['id']);
	        $data['status'] = 1;
	        $data['name'] = text($_REQUEST['name']);
	        switch ($type){
	            case 'electron' :
	                $data['model'] = strtoupper(text($_REQUEST['model']));
	                $data['packaging'] = strtoupper(text($_REQUEST['packaging']));
	                $data['value'] = strtoupper(text($_REQUEST['value']));
	                $model = "ElectronComponet";
	                break;
	            case 'cate' :
	                $data['pid'] = 0;
	                $data['mark'] = strtoupper(text($_REQUEST['mark']));
	                $model = "ElectronCategory";
	                break;
	            default:
	                break;
	        }
	        $reid = addUpdata($data,"$model");
	        //return
	        $this->_reCode();
	    }

	    /**
	     * 设置状态
	     * @author MaWei (http://www.phpyrb.com)
	     * @date 2014-8-6  下午11:32:01
	     */
	    function status(){
	        $status = intval($_REQUEST['status']) == '1' ? 0 : 1;
	        switch ($this->type){
	            case 'cate' :
	                $reid = status('BookCategory', $_REQUEST['ids'],$status);
	            case 'tag'  :
	                $reid = status('BookTag', $_REQUEST['ids'],$status);
	            default:
	                exit;
	        }
	        //状态更新返回
	        if($reid === false){
	            $msg['status'] = null;
	            $msg['msg'] = $status ? '显示失败！' : '隐藏失败！';
	        }else{
	            $msg['status'] = $status ? 1 : 2;
	            $msg['msg'] = $status ? '已显示' : '已隐藏';
	        }
	        echo json_encode($msg);
	        exit;
	    }

	    /**
	     * 删除标签、分类
	     * @author MaWei (http://www.phpyrb.com)
	     * @date 2014-8-10  下午5:16:04
	     */
	    function delete(){
	        $model = $_REQUEST['type'] == 'cate' ? 'BookCategory' : 'BookTag';
	        $reid = delall($_REQUEST['ids'],"$model");
	        if($reid === false){
	            echo null;
	        }else{
	            echo 1;
	        }
	        S('TagList',null);
	        S('CateList',null);
	        exit;
	    }
	}