function goList(url, iid) {
    window.location = url + "?iid=" + iid ;
}
//保存通用操作函数
function validateEmpty(eleName) {
    var obj = document.getElementById(eleName);
    var msg = document.getElementById(eleName + "Msg");
    if (obj.value != "") {
        obj.className = "right";
        if (msg != null) {
            msg.innerHTML = "<font color='#00FF00'>内容输入正确！</font>";
        }
        return true;
    } else {
        obj.className = "wrong";
        if (msg != null) {
            msg.innerHTML = "<font color='#FF0000'>内容不允许为空！</font>";
        }
        return false;
    }
}

function validateRegex(eleName, regex) {
    var obj = document.getElementById(eleName);
    var msg = document.getElementById(eleName + "Msg");
    if (regex.test(obj.value)) {
        obj.className = "right";
        if (msg != null) {
            msg.innerHTML = "<font color='#00FF00'>内容输入正确！</font>";
        }
        return true;
    } else {
        obj.className = "wrong";
        if (msg != null) {
            msg.innerHTML = "<font color='#FF0000'>输入内容格式有误！</font>";
        }
        return false;
    }
}

function changeColor(obj, color) {
    obj.bgColor = color;
}

function checboxSelect(obj,eleName){
	var item = document.all(eleName) ;
	if (item.length == undefined) { // 表示只有一个元素，不是数组
		document.getElementById(eleName).checked = obj.checked ;
	} else {
		for (var x = 0 ; x < item.length ; x ++){
			item[x].checked = obj.checked ;
		}
	}
}

function updateAll(url,paramName,eleName) {
	return deleteAll(url,paramName,eleName) ;
	
}
//	url：表示要删除的操作路径
//	paramName：表示要传递的参数名称
//	eleName：表示要去的数据的ID名称
function deleteAll(url,paramName,eleName) {
	var data = "" ; //	保存所有要删除的数据编号
	//	但是数据有可能是数组，也有可能只有一个
	var item = document.all(eleName) ;
	var count = 0 ; //	保存要删除的数据个数
	//	要判断是否有要删除的数据
	if (item.length == undefined) { // 表示只有一个元素，不是数组
		if (document.getElementById(eleName).checked == true){
			data += document.getElementById(eleName).value;
			count ++ ;
		}
	} else {
		for (var x = 0 ; x < item.length ; x ++) {
			console.log(item[x].checked);
			if(item[x].checked == true) {
				count ++ ;
				data += item[x].value + ",";
			}
		}
	}
	if (count > 0) {
		if (window.confirm("确定要执行操作吗？")) {
			window.location = url + "&" + paramName + "=" + data;
		}
	} else {
		alert("您还未选择任何要操作的数据！");
	}
}
function deleteAllParam(url,paramName,eleName) {
	var data = "" ; //	保存所有要删除的数据编号
	//	但是数据有可能是数组，也有可能只有一个
	var item = document.all(eleName) ;
	var count = 0 ; //	保存要删除的数据个数
	//	要判断是否有要删除的数据
	if (item.length == undefined) { // 表示只有一个元素，不是数组
		if (document.getElementById(eleName).checked != false){
			data += document.getElementById(eleName).value;
			count ++ ;
		}
	} else {
		for (var x = 0 ; x < item.length ; x ++) {
			if(item[x].checked == true) {
				data += item[x].value + ",";
				count ++ ;
			}
		}

	}
	if (count > 0) {
		if (window.confirm("确定要删除如下数据吗？")) {
			window.location = url + "&" + paramName + "=" + data;
		}
	} else {
		alert("您还未选择任何要删除的数据！");
	}
}

function openPage(url) {
	window.open(url,"查看详细信息","width=600;height=500;scollable=yes") ;
}

function closePage() {
	window.close() ;
}

function preview(file) {
    var prevDiv = document.getElementById('preview');
    if (file.files && file.files[0]) {
      var reader = new FileReader();
      reader.onload = function(evt) {
        prevDiv.innerHTML = '<img src="' + evt.target.result + '"/>';
      }
      reader.readAsDataURL(file.files[0]);
    } else {
      prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
    }
}
