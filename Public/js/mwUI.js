/**
 * @author MaWei
 * @time 2014-12-11
 * @home http://www.phpyrb.com
 */

var mwUI = {};
;(function ($,window,document) {
	//全选，返选，
	$.fn.extend(mwUI,{
		//全选
		CheckAll : function(Obj,checkclass){
			$(checkclass).prop('checked',Obj.prop('checked'));
		},
		//反选
		CheckRev : function(checkclass){
			$(checkclass).each(function (e) {
				$(this).prop('checked',!$(this).prop('checked'));
			});
		},
		//返回选中的值
		CheckIds : function (checkclass,toStr){
			var reIds = new Array();
			$(checkclass).each(function (e) {
				if($(this).prop('checked')){
					reIds.push($(this).val());	
				}
			});
			return toStr ? reIds.toString() : reIds; 
		},
		
		/**
		 * 下拉菜单
		 * @parem obj 要下拉的菜单对象
		 * @parem type ul|dl 下拉菜单的所有的标签
		 * @parem addclass 添加的样式
		 * @parem atag 添加样式的标签
		 */
		slideMenu : function (obj,type,addclass,atag){
			var tag = type == 'ul' ? 'li' : 'dd';
			var objlist = $(obj).children(tag);
			objlist.click(function () {
				objlist.children(type).slideUp(100);
				$(this).children(type).slideDown(500);
				if(atag){
					objlist.children(atag).removeClass(addclass);
					$(this).children(atag).addClass(addclass);
				}else{
					objlist.removeClass(addclass);
					$(this).addClass(addclass);
				}
			});
		},
		//表单为空检查
		CheckNull: function (Obj){
			var a = 0;
		},
		//ajax表单提交
		AjaxForm : function (Obj){
			//表单为空检查
			var formObj = Obj.parents('form');
			var nullstatus = 0;
			formObj.find('.checknull').each(function () {
				if(! $(this).val()){
					layer.error($(this).attr('emsg'));
					nullstatus ++;
					return false;
				}
			});
			if (nullstatus > 0) return false;
			var formVal = formObj.serializeArray();
			console.log(formVal);
			var url = Obj.attr('url');
			$.ajax({
				type : 'POST',
				url  : url,
				data : formVal,
				dataType : 'json'
			}).done(function (e) {
				if(e.reCode == 200){
					layer.msgjump(e.msg,e.reUrl);
				}else{
					layer.msg(e.emsg);
				}
			});
		},
	});
})(jQuery,window,document);

