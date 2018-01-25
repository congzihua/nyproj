//HTML�ϱ����±�ı��ʽ�ֽⷽ��
//by liwy 081107

// ��ҳ���������У��ϱ���±����
// �ϱ�ʹ��[sup][/sup]��ʽ���±�ʹ��[sub][/sub]��ʽ��
// ��Щ��ʽ��ɶԳ���,�磺
// X��Y�͵�ƽ����(X+Y)[sup]2[/sup]
// X�±�2��X[sub]2[/sub];
// Java�ϱ�tm��Java[sup]tm[/sup]

// �������±��һЩ����:������������
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
