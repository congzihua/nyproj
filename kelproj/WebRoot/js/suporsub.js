//HTML上标与下标的表达式分解方法
//by liwy 081107

// 在页面输入域中，上标或下标规则
// 上标使用[sup][/sup]格式，下标使用[sub][/sub]格式；
// 这些格式需成对出现,如：
// X与Y和的平方：(X+Y)[sup]2[/sup]
// X下标2：X[sub]2[/sub];
// Java上标tm：Java[sup]tm[/sup]

// 关于上下标的一些例子:（测试用例）
//(A[sub]B[sub]C[sub]D[sub]E[/sub][/sub][/sub][/sub])[sup]F[/sup]
//(X+Y)[sup]22[/sup]
//(X+Y)[sup]22[/sup]Z[sub]33[/sub]B
// X[sup]2[/sup]Y[sub]3[/sub]

String.prototype.replaceAll = stringReplaceAll;

function stringReplaceAll(AFindText,ARepText){
    var raRegExp = new RegExp(AFindText,"g");
    return this.replace(raRegExp,ARepText)
}

function doTrans(s){
    var r = s.replaceAll("\\[sub\\]", "<sub>");
    r = r.replaceAll("\\[\\/sub\\]", "</sub>");
    r = r.replaceAll("\\[sup\\]", "<sup>");
    r = r.replaceAll("\\[\\/sup\\]", "</sup>");
    return r;
}


function convertSupOrSub()
{
    var aTags = document.getElementsByTagName("SPAN");
	for (var i=0; i<aTags.length; i++)
	{
		if (aTags[i].className=="suporsub") {
			aTags[i].innerHTML = doTrans(aTags[i].innerHTML);
		}
	}
}
