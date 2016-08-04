<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  权限管理操作类
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016年8月4日
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Library;

    class Rbac{

        function __construct(){

        }

        /**
         * 父节点列表
         * @param  array $_where
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月4日 下午6:00:18
        */
        function getParentList($_where = []){
            $m = M('RbacParentNode');
            $list = $m->where($_where)->select();
            return fieldtokey($list);
        }

        /**
         * 父节点详情
         * @param  int $_node_id
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月4日 下午5:59:44
        */
        function getParentNodeInfo($_node_id){
            $m = M('RbacParentNode');
            $info = $m->where(['id'=>$_node_id])->find();
            return $info;
        }

        /**
         * 节点详情
         * @param  int $_node_id
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月4日 下午3:55:46
        */
        function getNodeInfo($_node_id){
            $m = M('RbacNode');
            $info = $m->where(['id'=>$_node_id])->find();
            return $info;
        }

        /**
         * 节点列表
         * @param  array $_where
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月4日 下午4:00:04
        */
        function getNodeList($_where = []){
            $m = M('RbacNode');
            $list = $m->where($_where)->select();
            return fieldtokey($list);
        }

        /**
         * 节点组详情
         * @param  array $_group_id
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月4日 下午4:03:32
        */
        function getNodeGroupInfo($_group_id){
            $m = M('RbacNodeGroup');
            $info = $m->where(['id'=>$_group_id])->find();
            return $info;
        }

        /**
         * 节点组列表
         * @param  array $_where
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月4日 下午4:12:32
        */
        function getNodeGroupList($_where = []){
            $m = M('RbacNodeGroup');
            $list = $m->where($_where)->select();
            return $list;
        }

        /**
         * 获取用户动作权限列表
         * @param  int $_uid
         * @param  int $_status
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月4日 下午4:23:53
        */
        function getUserRbacList($_uid,$_status = null){
            //提取用户权限组IDS
            $m = M('RbacUser');
            $where = [];
            $where['uid'] = $_uid;
            $_status && $where['status'] = $_status;
            $info = $m->where($where)->find();
            if($info['group_id'] == -1) return 'all';
            //获取节点列表
            $where = [];
            $_status && $where['status'] = $_status;
            $nodelist = $this->getNodeList($where);
            //提取用户权限组里的具体权限
            $where = [];
            $where['id'] = ['IN',$info['group_id']];
            $_status && $where['status'] = 1;
            $nodegrouplist = M('RbacNodeGroup')->where($where)->select();
            $rbaclist = [];
            foreach ($nodegrouplist as $k => $v){
                $rbacids = explode(',', $v['node_ids']);
                foreach ($rbacids as $k => $v){
                    if($nodelist[$v]['action'] == -1 || $nodelist[$v]['controller'] == -1){
                        $rbaclist['check'][$nodelist[$v]['controller']] = -1; //所有子节点
                    }else
                        $rbaclist['check'][$nodelist[$v]['controller']][] = $nodelist[$v]['action']; //具体子节点
                    //用于列表显示
                    $rbaclist['list'][$nodelist[$v]['controller']][] = $nodelist[$v]['action'];
                }
            }
            return $rbaclist;
        }
    }
