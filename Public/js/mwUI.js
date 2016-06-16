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
		//表单为空检查
		CheckNull: function (Obj){
			var obj = Obj ? 1 : 12;
		},
		//ajax表单提交
		AjaxForm : function (Obj){
			//表单为空检查
			var formObj = Obj.parents('form');
			var nullstatus = 0;
			formObj.find('.checknull').each(function () {
//				console.log($(this).attr('name'));
				if(! $(this).val()){
					layer.error($(this).attr('emsg'));
					nullstatus ++;
					return false;
				}
			});
			if (nullstatus > 0) return false;
			var formVal = formObj.serialize();
			var url = Obj.attr('url');
			$.ajax({
				type : 'POST',
				url  : url,
				data : formVal,
				dataType : 'JOSN'
			}).done(function (e) {
				if(e.reCode == 200){
					layer.msgjump(e.msg,e.url);
				}else{
					layer.msg(e.msg);
				}
			});
		},
	});
})(jQuery,window,document);

