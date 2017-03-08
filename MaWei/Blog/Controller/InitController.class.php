<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain: 项目入口初始化
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016年7月19日
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Blog\Controller;
    use Think\Controller;
    use Library\ArticleCateTag;

    class InitController extends Controller{
        //ajax返回定义
        protected $reCode = 200;
        protected $msg      =   'operate success!';
        protected $emsg     =   'operate error!';
        protected $restatus =   1;
        //分类，标签定义
        protected $catelist,$taglist;
        function _init(){
            //分类列表
            $this->_getCate();
            //标签列表
            $this->_getTag();
        }

        /**
         * 获取文章分类
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年7月19日 下午5:00:26
        */
        private function _getCate(){
            !C('Cate') && C('Cate',(new ArticleCateTag())->getArtCateList());
            !C('Menu') && C('Menu',getTree(C('Cate')));
            $this->assign('catelist',C("Cate"));
            $this->assign('naviMenu',C('Menu'));
            $this->catelist = C('Menu');
        }

        /**
         * 获取文章标签
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年7月19日 下午5:02:26
        */
        private function _getTag(){
            !C('Tag') && $taglist = (new ArticleCateTag())->getArtTagList();
            $this->assign('taglist',$taglist);
            $this->taglist = $taglist;
        }

        function _clear(){
            C("Tag");
            C('Cate');
            echo 'clear success';
        }

        /**
         * ajax接口返回
         * @param  array $_data 数据
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年7月26日 上午11:10:33
        */
        protected function _reCode($_data = []){
            $data = [];
            $data['reCode']       =   $this->reCode;
            $data['msg']        =   $this->msg;
            $data['emsg']       =   $this->emsg;
            $data['restatus']   =   $this->restatus;
            $data['data']       =   $_data;
            echo json_encode($data);
            exit;
        }
    }