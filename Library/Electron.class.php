<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  电子元件操作模型
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016年6月4日
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Library;

    class Electron {

        function __construct(){

        }

        /**
         * 获取元件列表
         * @param  array $_where 条件
         * @param  string $_limit 页数
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年6月4日 下午12:26:36
        */
        function getElectronList($_where = [],$_limit = 'count'){
            $m = M('ElectronComponet');
            if($_limit == 'count'){
                $count = $m->where($_where)->count();
                return $count;
            }
            $list = $m->where($_where)->order('id DESC')->select();
            return  $list;
        }

        /**
         * 获取元件详情
         * @param  int $_id
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年6月4日 下午12:54:30
        */
        function getElectronInfo($_id){
            $info = M('ElectronComponet')->where(['id'=>$_id])->find();
            return $info;
        }

        /**
         * 元件分类
         * @param  array $_where 条件
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年6月4日 下午12:28:51
        */
        function getElectCate($_where = []){
            $m = M('ElectronCategory');
            $list = $m->where($_where)->order('id DESC')->select();
            return $list;
        }

    }