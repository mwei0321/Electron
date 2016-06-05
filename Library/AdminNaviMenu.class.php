<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016年6月3日
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Library;

    class AdminNaviMenu {
        //model objedt var
        protected $naviMenu;
        //var
        protected $menu;

        function __construct(){
            $this->naviMenu = M('AdminNavigatorMenu');
        }

        /**
         * 返回返回菜单列表
         * @param  int $_pid　父级ID
         * @return array
         * @author MaWei (http://www.phpyrb.com)
         * @date 2014-8-2  下午9:45:07
         */
        function getAdminNaviMenu($_where = array()){
            $where = array();
            $menulist = $this->naviMenu->where($_where)->order('sort DESC')->select();
            $this->menu = array();
            $this->level($menulist);
            return $this->menu;
        }

        /**
         * 跟ID返回菜单信息
         * @param  int $_menuid 菜单ID
         * @return array
         * @author MaWei (http://www.phpyrb.com)
         * @date 2014-8-2  下午9:57:44
         */
        function getMenuInfo($_menuid){
            $menuinfo = $this->naviMenu->where(array('id'=>$_menuid))->find();
            return $menuinfo;
        }

        /**
         * 返回菜单层级
         * @param  array　$_menu
         * @param  int $_pid
         * @param  int $_level
         * @return array
         * @author MaWei (http://www.phpyrb.com)
         * @date 2014-9-12  下午10:19:12
         */
        function level($_menu,$_pid = 0,$_level=0){
            foreach ($_menu as $k => $v){
                if($v['pid'] == $_pid){
                    $this->menu[$k] = $v;
                    $this->menu[$k]['level'] = $_level;
                    $this->menu[$k]['str'] = str_repeat('&nbsp;&nbsp;&nbsp;&nbsp;|----', $_level);
                    unset($_menu[$k]);
                    $this->level($_menu,$v['id'],$_level+1);
                }
            }
            return $this->menu;
        }

        /**
         * 格式化后台导航菜单
         * @param  array $_menu 菜单列表
         * @param  int $_level 菜单层级
         * @return array
         * @author MaWei (http://www.phpyrb.com)
         * @date 2014-9-12  下午10:19:46
         */
        function formatNaviMenu($_menu,$_level = 0){
            $temp = array();
            foreach ($_menu as $k => $v){
                if($v['pid'] == 0){
                    $temp['topmenu'][$v['key']] = $v;
                }else{
                    $temp['leftmenu'][$v['key']][] = $v;
                }
            }
            return $temp;
        }
    }