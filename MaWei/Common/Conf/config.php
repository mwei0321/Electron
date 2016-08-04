<?php
	/**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  系统初始配置
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: ONLY <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016-06-02
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :  http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

	$iniconfig = [
			'MODULE_ALLOW_LIST'     => array('Blog','Admin','Member',''),
			'DEFAULT_MODULE'     	=> 'Blog', //默认模块
			'SESSION_AUTO_START' 	=> true, //是否开启session
			//URL 配置
			'URL_MODEL'          	=> '2', //URL模式
			'URL_PATHINFO_DEPR'		=>'-', // 更改PATHINFO参数分隔符

			//模板配置
			'DEFAULT_THEME'    =>    'default',// 设置默认的模板主题
			// 		'VIEW_PATH'				=>'./Theme/',//视图目录指定
			'TMPL_FILE_DEPR'		=>'_',  //目录结构太深
			'ALLOW_IMAGE_EXTS'		=> 'jpg,png,gif,jpeg',
			'ALLOW_FILE_EXTS'		=> 'doc,pdf,zip,7z,txt,xls,rar',
			'ALLOW_FILE_SIZE'     	=> 300292200,
			'UPLOAD_DIY_NAME'		=> 'www.kandianshu.com'.date('YmdHms').substr(uniqid(),-5),

			'INSTALLAPP_PATH'       => ROOT_PATH.'/installapp/',

	        //缓存方式
	        'DATA_CACHE_TYPE'       => 'file'
	];

	return $iniconfig;

	function config (){
		$m = M('SystemInitConfig');

	}

	/**
	 * define return status code
	 * @return array
	 * @author MaWei (http://www.phpython.com)
	 * @date 2015年6月12日  上午9:54:55
	 */
	$recode = [
	    // 2xx status code
	    '200' => 'success', //成功
	    '204' => 'service access success,but no data', //访问成功，但没有数据

	    // 4xx status code
	    '400' => 'error request', //错误请求,服务器不理解请求的语法
	    '401' => 'no access', //（未授权） 请求要求身份验证。 对于需要登录的网页，服务器可能返回此响应。
	    '403' => 'service reject request', //服务器拒绝请求。
	    '404' => 'no find page', //服务器没有找到指定页面。
	    '405' => 'request method error', //禁用请求中指定的方法。
	    '408' => 'request over time', //请求超时
	    '410' => 'request source delete', //请求的资源已永久删除

	    '430' => 'data add or updata or delete fail', //数据添加，更新失败
	    '440' => 'request param error', //请求参数错误

	    //5xx status code
	    '500' => 'server error', //服务器内部错误

	    //7xx status code

	];