<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  基于ThinkPHP的公用函数
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: ONLY <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2014-4-24
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    /**
     * 数据库添加、更新操作
     * @param  array $_data 数据
     * @param  string $_model 表名
     * @param  string|array $_upfiled 更新字段
     * @return array
     * @author MaWei (http://www.phpython.com)
     * @date 2016年6月2日 下午6:48:11
     */
    function addUpdata($_data,$_model,$_upfiled = 'id'){
        $m = M("$_model");
        $reid = FALSE;
        if($_data[$_upfiled] || $_data[$_upfiled[0]]){
            $where = [];
            if(is_array($_upfiled)){
                foreach ($_upfiled as $k => $v){
                    $_data[$v] && $where[$v] = $_data["$v"];
                    unset($_data[$v]);
                }
            }else{
                $where["$_upfiled"] = $_data["$_upfiled"];
                unset($_data["$_upfiled"]);
            }
            $reid = $m->where($where)->save($_data);
        }else{
            $reid = $m->add($_data);
        }
//         echo $this->remind_M->getLastSql();
        return $reid;
    }

    /**
     * 公共删除函数
     * @param  int | string $_ids
     * @param  model $_model 表名
     * @return array
     * @author MaWei (http://www.phpyrb.com)
     * @date 2014-8-7  下午11:01:39
     */
    function delall($_ids,$_model){
        $model = M("$_model");
        $reid = $model->delete($_ids);

        return $reid;
    }

    /**
     * 排序
     * @param array
     * @param string
     * @return array
     * @author MaWei (http://www.phpyrb.com)
     * @date 2014-8-5 下午6:35:39
     */
    function setsort($_model,$_newsort,$_oldsort,$_field = 'sort'){
        $m = M("$_model");
        $where = array();
        if($_newsort > $ $_oldsort){
            $where["$_field"] = array(array('GT',$_oldsort),array('ELT',$_newsort));
            $reid = $m->where($where)->setInc("$_field");
            echo $m->getLastSql();exit;
        }elseif($_newsort < $_oldsort){
            $where["$_field"] = array(array('LT',$_oldsort),array('EGT',$_newsort));
            $reid = $m->where($where)->setDec("$_field");
        }elseif($_newsort == $_oldsort){
            return 1;
        }
        if($reid === false){
            return null;
        }else{
            return 1;
        }
    }

    /**
     * 修改状态
     * @param model $_model 表名
     * @param int|array $_ids 要修改的ID
     * @param string $_string 要修改的状态
     * @return array
     * @author MaWei (http://www.phpyrb.com)
     * @date 2014-8-6 上午10:23:32
     */
    function status($_model,$_ids,$_status = 0){
        if(empty($_ids)) return false;
        $model = null;
        if(strpos($_model,'|') === false){
            $model = M("$_model");
        }else{
            $m = explode('|', $_model);
            $model = M("$m[0]",$m['1']);
        }
        $where = array();
        $where['id'] = is_string($_ids) ? array('IN',"$_ids") : $_ids;
        $reid = $model->where($where)->setField('status',$_status);
        // 		echo $model->getlastsql();
        return $reid;
    }

	/**
	 * json return
	 * @param  array
	 * @param  string
	 * @return array
	 * @author MaWei (http://www.phpython.com)
	 * @date 2016年6月16日 上午10:50:21
	*/
    function jsonReturn($_reUrl = -1,$_reCode = 200,$_msg = 'opertion success!'){
    	$reCode = $_reCode ? : 200;
    	$_reUrl = $_reUrl ? : -1;
		$_msg = $_msg ? :1;
		$data = [
			'reCode'	=>	$reCode,
		];
    }