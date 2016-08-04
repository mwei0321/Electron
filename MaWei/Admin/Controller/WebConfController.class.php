<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  前台设置
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016年8月3日
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Admin\Controller;
    use Admin\Controller\InitController;
    use Library\WebConf;

    class WebConfController extends InitController{
        private $webConf;
        function _init(){
            parent::_init();
            //实例前台配置对象
            $this->webConf = new WebConf();
        }

        /**
         * 前台菜单设置
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月3日 上午9:19:47
        */
        function naviMenu(){
            $list = $this->webConf->getHomeNaviMenu();

            $this->assign('list',$list);
            $this->display();
        }

        /**
         * 添加、修改页
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月3日 上午9:37:34
        */
        function edit(){
            //类型
            $type = $_REQUEST['type'];
            //ID
            $id = intval($_REQUEST['id']);
            //
            switch ($type){
                case 'naviMenu':
                    if($id > 0)
                        $info = $this->webConf->getNaviMenuInfo($id);
                    //父菜单
                    $pmenu = $this->webConf->getHomeNaviMenu(['pid'=>0]);
                    $this->assign('pmenu',$pmenu);
                    //模板名称
                    $template = 'menuedit';
                    break;
                default:
                    $info = [];
                    break;
            }

            $this->assign('type',$type);
            $this->assign('info',$info);
            $this->display($template);
        }

        /**
         * 数据添加，修改
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月3日 下午7:19:40
        */
        function addUpdata(){
            //类型
            $type = $_REQUEST['type'];
            //ID
            $id = intval($_REQUEST['id']);
            //
            $data = [];
            $id && $data['id'] = $id;
            switch ($type){
                case 'naviMenu':
                    $data['pid'] = intval($_REQUEST['pid']);
                    $data['name'] = $_REQUEST['name'];
                    $data['url'] = $_REQUEST['url'];
                    $data['sort'] = intval($_REQUEST['sort']);
                    $data['status'] = 1;
                    $data['description'] = text($_REQUEST['description']);
                    break;
                case '':
                    $data['name'] = '';
                    $data['id'] = 1;
                    break;
                default:
                    break;
            }
            $reid = addUpdata($data, 'WebNaviMenu');
            $reid === false && $this->reCode = 430;
            $this->_reCode();
        }
    }