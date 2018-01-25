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