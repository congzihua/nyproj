
if(!window.layer){
  window.layer = parent.layer;
  window.layenWin = parent;
}else{
	  window.layenWin = window;
}
if(!window.showModalDialog){
  window.showModalDialog = function(url, _, options, callback){
	var matchs = options.match(/dialogWidth:(.*px)\D*dialogHeight:(.*px)/);
	var id = layer.open({
      type: 2,
      area: [matchs[1], matchs[2]],
      maxmin: true,
      content: url,
      success: function(layero, index){
    	  var iframeWin = layenWin[layero.find('iframe')[0]['name']];
    	  iframeWin.close = function(){
    		  callback && callback(iframeWin.returnValue)
    		  layer.close(id);
    	  }
      }
    });
  }
}
var net = new Object();
net.READY_STATE_UNINITIALIZED = 0;
net.READY_STATE_LOADING = 1;
net.READY_STATE_LOADED = 2;
net.READY_STATE_INTERACTIVE = 3;
net.READY_STATE_COMPLETE = 4;
net.ContentLoader = function (url, onload, onerror, httpMethod, params) {
	this.url = url;
	this.req = null;
	this.onload = onload;
	this.loadXMLDoc(url, httpMethod, params);
	this.onerror = (onerror) ? onerror : this.defaultError;
};
net.ContentLoader.prototype = {
    loadXMLDoc:function (url, httpMethod, params) {
	if (!httpMethod) {
		httpMethod = "GET";
	}
	if (window.XMLHttpRequest) {
		this.req = new XMLHttpRequest();
	} else {
		if (window.ActiveXObject) {
			this.req = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	if (this.req) {
		try {
			var loader = this;
			this.req.onreadystatechange = function () {
				loader.onReadyState.call(loader);
			};
			this.req.open(httpMethod, url, true);
			this.req.setRequestHeader("Content-Type","text/xml");
			this.req.send(params ? this.params : null);
		}
		catch (err) {
			this.onerror.call(this);
		}
	}
}, onReadyState:function () {
	var req = this.req;
	var ready = req.readyState;
	if (ready == net.READY_STATE_COMPLETE) {
		var httpStatus = req.status;
		if (httpStatus == 200 || httpStatus == 0) {
			this.onload.call(this);
		} else {
			this.onerror.call(this);
		}
	}
}, getReq:function () {
	return this.req;
}, defaultError:function () {
	alert("error fetching data!");
}};

window.showModalDialog_new = function(url,mixedVar,features){
	window.hasOpenWindow = true;
	if(mixedVar) var mixedVar = mixedVar;
	//因window.showmodaldialog 与 window.open 参数不一样，所以封装的时候用正则去格式化一下参数
	if(features) var features = features.replace(/(dialog)|(px)/ig,"").replace(/;/g,',').replace(/\:/g,"=");
	//window.open("Sample.htm",null,"height=200,width=400,status=yes,toolbar=no,menubar=no");
	//window.showModalDialog("modal.htm",obj,"dialogWidth=200px;dialogHeight=100px");
	var left = (window.screen.width - parseInt(features.match(/width[\s]*=[\s]*([\d]+)/i)[1]))/2;
	var top = (window.screen.height - parseInt(features.match(/height[\s]*=[\s]*([\d]+)/i)[1]))/2;
	window.myNewWindow = window.open(url,"_blank",features);
}
