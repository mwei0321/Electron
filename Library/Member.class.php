<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  会员操作模型
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016年9月7日
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Library;

    class Member{

        function __construct(){

        }

        /**
         * 会员列表
         * @param  array
         * @param  string
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年9月7日 下午6:12:12
        **/
        function getMemberList($_page = 'count',$_where = []){
            $m = M('Member');
            if($_page == 'count'){
                $count = $m->where($_where)->count();
                return $count;
            }
            $list = $m->where($_where)->order('id DESC')->select();
            return $list;
        }
    }