package com.founder.enp.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
//import org.jivesoftware.smack.XMPPConnection;

import com.founder.enp.entity.Advice;
import com.founder.enp.entity.Attache;
import com.founder.enp.entity.Authorization;
import com.founder.enp.entity.DocEntity;
import com.founder.enp.entity.DocFlowsKeyWord;
import com.founder.enp.entity.DocNum;
import com.founder.enp.entity.Flows;
import com.founder.enp.entity.Parameter;
import com.founder.enp.entity.User;
import com.founder.enp.entity.Watches;
import com.founder.enp.forms.DocNumOperForm;
import com.founder.enp.forms.DocsForm;
import com.founder.enp.forms.SelectTemplateForm;
import com.founder.enp.forms.SubmitForm;
import com.founder.enp.iface.DocDao;
import com.founder.enp.persistence.DaoConfig;
//import com.founder.enp.util.XMPPConnectionManager;
import com.ibatis.dao.client.DaoManager;

public class DocService {

	private static Log log = LogFactory.getLog(DocService.class);

	private DaoManager daoMgr;

	private static Integer lock = 0;

	private DocDao dao;

	public DocService() {
		daoMgr = null;
		dao = null;
		try {
			daoMgr = DaoConfig.getDaoManager();
			dao = (DocDao) daoMgr.getDao(DocDao.class);
		} catch (Exception ex) {
			log.error((new StringBuilder(
					"\u521B\u5EFAdaomanager\u51FA\u73B0\u5F02\u5E38")).append(
					ex.getMessage()).toString());
		}

	}

	public void finishDoc(HttpServletRequest request) {

		String flowsid = (String) request.getSession().getAttribute("flowsid");
		Authorization authorization = (Authorization) request.getSession()
				.getAttribute("authorization");
		java.util.StringTokenizer token = new java.util.StringTokenizer(
				flowsid, ";");
		java.text.SimpleDateFormat dateformat = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		while (token.hasMoreTokens()) {
			Integer flowid = Integer.parseInt(token.nextToken());
			Flows flows = dao.getFlows(flowid);
			flows.setId(flowid);
			flows.setStatus("已办结");
			// flows.setOperationtor(authorization.getName());
			flows.setAdvice("");
			flows.setFlag(1);
			flows.setOpertime(dateformat.format(new Date()));
			flows.setVersion(0);
			dao.updateFlows(flows);
			flows.setProcessorid(0);
			flows.setPowergroup(7);
			flows.setFatherid(flowid);
			flows.setStatus("已办结");
			flows.setVersion(1);
			flows.setFlowName("已办结"); // 标识流程节点名称
			flows.setOperationtor(authorization.getName());// 标识当前节点是由谁送过来的
			flows.setFlowtor(authorization.getName()); // 标识当前流程节点是由谁来负责操作.
			flows.setFlag(0);
			dao.addFlows(flows);
		}
	}

	@SuppressWarnings("unchecked")
	public boolean modifyDoc(HttpServletRequest request) {

		List<Attache> attacheList = null;
		try {
			daoMgr.startTransaction();
			DocsForm docsForm = (DocsForm) request.getSession().getAttribute(
					"docsForm");
			attacheList = (List) request.getSession().getAttribute("attache");
			DocEntity docEntity = new DocEntity();

			/*
			 * docEntity.setCopyto(docsForm.getCopyto());
			 * 
			 * docEntity.setCreatemode(docsForm.getCreatemode());
			 * docEntity.setCreateorg(docsForm.getCreateorg());
			 * docEntity.setKeywords(docsForm.getKeywords());
			 * docEntity.setPrintnum(docsForm.getPrintnum());
			 * docEntity.setPublishlevel(docsForm.getPublishlevel());
			 * docEntity.setPublishOrg(docsForm.getPublishOrg()); docEntity
			 * .setPublishtime(docsForm.getPublishtime().equals("") ? null :
			 * docsForm.getPublishtime());
			 * docEntity.setSecret(docsForm.getSecret());
			 * docEntity.setSecretime(docsForm.getSecretime());
			 * docEntity.setTitle(docsForm.getTitle());
			 * docEntity.setToOrg(docsForm.getToOrg());
			 * docEntity.setTypename(docsForm.getTypename());
			 * docEntity.setCreator(docsForm.getCreator());
			 * docEntity.setUrgence(docsForm.getUrgence());
			 * docEntity.setDocid(docsForm.getDocid());
			 */
			docEntity.setCopyto(docsForm.getCopyto());

			docEntity.setCreatemode(docsForm.getCreatemode());
			docEntity.setCreateorg(docsForm.getCreateorg());
			docEntity.setKeywords(docsForm.getKeywords());
			docEntity.setPrintnum(docsForm.getPrintnum());
			docEntity.setPublishlevel(docsForm.getPublishlevel());
			docEntity.setPublishOrg(docsForm.getPublishOrg());
			docEntity
					.setPublishtime(docsForm.getPublishtime().equals("") ? null
							: docsForm.getPublishtime());
			docEntity.setSecret(docsForm.getSecret());
			docEntity.setSecretime(docsForm.getSecretime());
			docEntity.setTitle(docsForm.getTitle());
			docEntity.setToOrg(docsForm.getToOrg());
			docEntity.setTypename(docsForm.getTypename());
			docEntity.setCreator(docsForm.getCreator());
			docEntity.setUrgence(docsForm.getUrgence());
			docEntity.setDocid(docsForm.getDocid());
			docEntity.setDocnum(docsForm.getDocnum());
			docEntity.setMaketime(docsForm.getMaketime());
			// 修改
			dao.updateDoc(docEntity);
			if (attacheList != null) {
				Iterator<Attache> itera = attacheList.iterator();
				while (itera.hasNext()) {
					Attache attache = itera.next();
					if (attache.getFileOrgName() != null) {
						attache.setDocid(docsForm.getDocid());
						dao.addAttache(attache);
					}
				}
			}
			if (request.getParameter("oper").equals("finish")) {
				finishDoc(request);
			}
			daoMgr.commitTransaction();
			return true;
		} catch (Exception ex) {
			log.error("修改公文失败" + ex.getMessage());
			if (attacheList != null) {
				Iterator<Attache> itera = attacheList.iterator();
				ParameterService service = new ParameterService();
				Parameter param = service.listParameter();
				while (itera.hasNext()) {
					Attache attache = itera.next();
					if (attache.getFileOrgName() != null) {
						String attachePath = param.getAttacheip()
								+ attache.getFilename();
						attachePath = attachePath.replace("\\", "\\\\");
						File file = new File(attachePath);
						if (file.exists())
							file.delete();
					}

				}

			}
			return false;
		} finally {
			daoMgr.endTransaction();
		}
	}

	@SuppressWarnings("unchecked")
	public boolean addDoc(HttpServletRequest request) {
		String contentName = "";
		List<Attache> attacheList = null;
		try {
			daoMgr.startTransaction();
			Authorization authorization = (Authorization) request.getSession()
					.getAttribute("authorization");
			DocsForm docsForm = (DocsForm) request.getSession().getAttribute(
					"docsForm");
			attacheList = (List) request.getSession().getAttribute("attache");
			SelectTemplateForm selectTemplateForm = (SelectTemplateForm) request
					.getSession().getAttribute("selectTemplate");
			DocEntity docEntity = new DocEntity();
			contentName = selectTemplateForm.getContentName();
			docEntity.setContent(contentName.substring(contentName
					.lastIndexOf("\\\\") + 2, contentName.length()));
			docEntity.setCopyto(docsForm.getCopyto());
			// docEntity.setCreatemode(docsForm.getCreatemode());
			docEntity.setCreateorg(docsForm.getCreateorg());
			docEntity.setKeywords(docsForm.getKeywords());
			// docEntity.setPrintnum(docsForm.getPrintnum());
			// docEntity.setPublishlevel(docsForm.getPublishlevel());
			docEntity.setPublishOrg(docsForm.getPublishOrg());
			// docEntity.setPublishtime(docsForm.getPublishtime());
			docEntity.setSecret(docsForm.getSecret());
			docEntity.setSecretime(docsForm.getSecretime());
			docEntity.setTitle(docsForm.getTitle());
			docEntity.setToOrg(docsForm.getToOrg());
			docEntity.setTypename(docsForm.getTypename());
			docEntity.setCreator(docsForm.getCreator());
			docEntity.setUrgence(docsForm.getUrgence());

			int docid = dao.addDoc(docEntity);
			Flows flows = new Flows();

			flows.setDocid(docid);
			flows.setFatherid(0);
			flows.setFlag(0);
			flows.setPowergroup(0);
			flows.setProcessorid(authorization.getLeaderid());
			flows.setStatus("起草中");
			flows.setFlowName("起草");
			flows.setVersion(1);
			flows.setFlowtor(authorization.getName());
			flows.setOperationtor(authorization.getName());
			dao.addFlows(flows);

			if (attacheList != null) {
				Iterator<Attache> itera = attacheList.iterator();
				while (itera.hasNext()) {
					Attache attache = itera.next();
					attache.setDocid(docid);
					dao.addAttache(attache);
				}
			}

			daoMgr.commitTransaction();
			return true;
		} catch (Exception ex) {
			log.error("添加公文失败" + ex.getMessage());
			File file = new File(contentName);
			if (file.exists())
				file.delete();
			if (attacheList != null) {
				Iterator<Attache> itera = attacheList.iterator();
				ParameterService service = new ParameterService();
				Parameter param = service.listParameter();
				while (itera.hasNext()) {
					Attache attache = itera.next();
					String attachePath = param.getAttacheip()
							+ attache.getFilename();
					attachePath = attachePath.replace("\\", "\\\\");
					file = new File(attachePath);
					file.delete();

				}

			}
			return false;
		} finally {
			daoMgr.endTransaction();
		}
	}

	public List getFlowList(DocFlowsKeyWord keyword) {
		try {
			return dao.getFlowsList(keyword);
		} catch (Exception ex) {
			log.error("查询列表错误" + ex.getMessage());
			return null;
		}
	}

	public Integer getFlowListCount(DocFlowsKeyWord keyword) {

		try {
			return dao.getFlowsListCount(keyword);
		} catch (Exception ex) {
			log.error("查询列表错误" + ex.getMessage());
			return null;
		}
	}

	public Integer getFlowAllListCount(DocFlowsKeyWord keyword) {

		try {
			return dao.getFlowsFinishAllListCount(keyword);
		} catch (Exception ex) {
			log.error("查询列表错误" + ex.getMessage());
			return null;
		}
	}

	public List getFlowFinishAllList(DocFlowsKeyWord keyword) {
		try {
			return dao.getFlowsFinishAllList(keyword);
		} catch (Exception ex) {
			log.error("查询列表错误" + ex.getMessage());
			return null;
		}
	}

	public List getFlowFinishList(DocFlowsKeyWord keyword) {
		try {
			return dao.getFlowsFinishList(keyword);
		} catch (Exception ex) {
			log.error("查询列表错误" + ex.getMessage());
			return null;
		}
	}

	public String getUserFinishDoc(int userid) {
		try {
			List list = dao.getUserFinishDoc(userid);
			Iterator iter = list.iterator();
			StringBuffer docidBuffer = new StringBuffer();
			while (iter.hasNext()) {
				Flows flows = (Flows) iter.next();
				docidBuffer.append(flows.getDocid()).append(",");
			}

			String docids = docidBuffer.toString();
			if (docids.equals(""))
				return "0";
			return docids.substring(0, docids.lastIndexOf(","));
		} catch (Exception ex) {
			log.error(ex.getMessage());
			return "0";
		}
	}

	public Integer getFlowFinishListCount(DocFlowsKeyWord keyword) {

		try {
			return dao.getFlowsFinishListCount(keyword);
		} catch (Exception ex) {
			log.error("查询列表错误" + ex.getMessage());
			return null;
		}
	}

	public DocEntity getDoc(Integer docid) {
		try {
			return dao.getDoc(docid);
		} catch (Exception ex) {
			log.error("获得公文错误" + ex.getMessage());
			return null;
		}
	}

	public List getDocAttache(Integer docid) {
		try {
			return dao.getDocAttache(docid);
		} catch (Exception ex) {
			log.error("获得公文附件错误" + ex.getMessage());
			return null;
		}
	}

	public boolean restore(String flowids) {
		try {
			daoMgr.startTransaction();
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					flowids, ";");
			while (token.hasMoreTokens()) {
				dao.restoreDoc(Integer.parseInt(token.nextToken()));
			}
			daoMgr.commitTransaction();
			return true;
		} catch (Exception ex) {
			log.error("恢复公文错误" + ex.getMessage());
			return false;
		} finally {
			daoMgr.endTransaction();
		}
	}

	public int deleteDoc(String flowids) {

		try {
			daoMgr.startTransaction();
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					flowids, ";");
			while (token.hasMoreTokens()) {
				if (dao.checkDeleteDoc(Integer.parseInt(token.nextToken())) > 0)
					return 2;
			}
			token = new java.util.StringTokenizer(flowids, ";");
			while (token.hasMoreTokens()) {
				dao.deleteDoc(Integer.parseInt(token.nextToken()));
			}

			daoMgr.commitTransaction();
			return 1;
		} catch (Exception ex) {
			log.error("删除公文到垃圾箱错误" + ex.getMessage());
			return 0;
		} finally {
			daoMgr.endTransaction();
		}
	}

	private void updateConterSignStatus(Integer flowid, String status,
			String userName) throws Exception {

		Flows flows = new Flows();
		flows.setStatus(status);
		flows.setFlag(6);
		flows.setOperationtor(userName);
		flows.setId(flowid);
		flows.setAdvice("");
		dao.updateConterSignStatus(flows);
	}

	public boolean submitDoc(HttpServletRequest request, SubmitForm frm) {
		try {
			daoMgr.startTransaction();
			String status = "";
			switch (frm.getPowerid()) {
			case 1:
				status = "待核稿";
				break;
			case 2:
				status = "承办处审核";
				break;
			case 3:
				status = "承办部室审批";
				break;
			case 4:
				status = "主管书记审批";
				break;
			case 5:
				status = "记协负责人审批";
				break;
			case 6:
				status = "审批完毕";
				break;
			default:
				status = "未知状态";
			}
			Authorization authorization = (Authorization) request.getSession()
					.getAttribute("authorization");

			java.util.StringTokenizer token = new java.util.StringTokenizer(frm
					.getFlowids(), ";");
			java.text.SimpleDateFormat dateformat = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			while (token.hasMoreTokens()) {
				Integer flowsid = Integer.parseInt(token.nextToken());
				if (!checkCounterSignISSubmit(String.valueOf(flowsid) + ";")) {
					updateConterSignStatus(flowsid, "公文已提交,未完成会签",
							authorization.getName());
				}
				Flows flows = dao.getFlows(flowsid);
				flows.setProcessorid(frm.getProcessid());
				flows.setPowergroup(frm.getPowerid());
				dao.updateDocNew(flows);
				flows.setFatherid(flowsid);
				flows.setPowergroup(frm.getPowerid());
				flows.setProcessorid(frm.getProcessid());
				flows.setStatus(status);
				flows.setVersion(1);
				flows.setFlowName(status); // 标识流程节点名称
				flows.setOperationtor(authorization.getName());// 标识当前节点是由谁送过来的
				flows.setFlowtor(frm.getName()); // 标识当前流程节点是由谁来负责操作.

				flows.setFlag(0);
				dao.addFlows(flows);
				flows.setId(flowsid);
				flows.setStatus(status);
				flows.setOperationtor(frm.getName());
				flows.setAdvice(frm.getAdvice());
				flows.setFlag(1);
				flows.setOpertime(dateformat.format(new Date()));
				flows.setVersion(1);
				dao.updateFlows(flows);
				/*
				 * Integer parentID = dao.selectParentFlows(flowsid); while
				 * (parentID != 0) { flows.setId(parentID);
				 * flows.setStatus(status); dao.updateParentStatus(flows);
				 * parentID = dao.selectParentFlows(parentID); }
				 */
			}
			String adviceFlag = request.getParameter("adviceFlag");
			if (adviceFlag.equals("1") && !frm.getAdvice().trim().equals("")) {
				UserService service = new UserService();
				Advice advice = new Advice();
				advice.setUserid(authorization.getUserid());
				advice.setAdvice(frm.getAdvice());
				service.addAdvice(advice);
			}

			if (frm.getEmail() == 1) {
				sendEmail(frm, String.valueOf(frm.getProcessid()));
			}
			if (frm.getMessage() == 1) {
				sendIM(frm, String.valueOf(frm.getProcessid()));
			}
			daoMgr.commitTransaction();

		} catch (Exception ex) {
			log.error("公文提交失败" + ex.getMessage());
			return false;
		} finally {
			daoMgr.endTransaction();
		}

		return true;
	}

	// 即时通信
	public void sendIM(SubmitForm frm, String userids) {

		java.util.StringTokenizer token = new java.util.StringTokenizer(
				userids, ";");
		UserService service = new UserService();

		String domain = com.founder.enp.util.ConfigManager
				.getConfigProperty("im.domain");
		String message = "公文提示：" + frm.getRemark();
		try {
			// 以下可以通过程序向spark帐号发信息，参数为openfire服务器的主机域名
//			XMPPConnection connection = XMPPConnectionManager.getInstance()
//					.getConnection();
           // System.out.println("connect ok");
			while (token.hasMoreTokens()) {
				Integer userid = Integer.parseInt(token.nextToken());
				User user = service.queryUserInfo(userid);
				String im = user.getAccount();
				//System.out.println(im);
//				org.jivesoftware.smack.packet.Message packet = new org.jivesoftware.smack.packet.Message(
//						im + "@" + domain);
				//System.out.println(domain);
//				packet.setBody(message);
				//System.out.println(message);
//				connection.sendPacket(packet);
				//System.out.println("OK");

			}
		} catch (Exception ex) {
			log.error(ex.getMessage());
		}
	}

	public void sendEmail(SubmitForm frm, String userids) {
		String account = com.founder.enp.util.ConfigManager
				.getConfigProperty("mail.account");
		String password = com.founder.enp.util.ConfigManager
				.getConfigProperty("mail.password");
		String smtp = com.founder.enp.util.ConfigManager
				.getConfigProperty("mail.smtp");
		java.util.StringTokenizer token = new java.util.StringTokenizer(
				userids, ";");
		UserService service = new UserService();
		Properties props = new Properties();
		props.put("mail.smtp.host", smtp);
		props.put("mail.smtp.auth", "true"); // 允许smtp校验
		props.put("mail.smtp.connectiontimeout", "10000");
		props.put("mail.smtp.timeout", "10000");
		Session sendMailSession = Session.getInstance(props, null);

		Message newMessage = new MimeMessage(sendMailSession);
		try {
			Transport transport = sendMailSession.getTransport("smtp");
			transport.connect(smtp, account, password);
			// 设置mail主题
			String mail_subject = "待办公文系统通知";
			newMessage.setSubject(mail_subject);
			newMessage.setFrom(new InternetAddress(account));
			Address addressTo[] = new InternetAddress[token.countTokens()];
			int n = 0;
			while (token.hasMoreTokens()) {
				Integer userid = Integer.parseInt(token.nextToken());
				User user = service.queryUserInfo(userid);
				String email = user.getEmail();
				addressTo[n] = new InternetAddress(email);
				n++;
			}
			newMessage.setRecipients(Message.RecipientType.TO, addressTo);
			newMessage.setSentDate(new java.util.Date());
			String mail_text = frm.getRemark();
			newMessage.setText(mail_text);

			newMessage.saveChanges(); // 保存发送信息
			transport.sendMessage(newMessage, newMessage.getAllRecipients()); // 发送邮件

			transport.close();
		} catch (Exception ex) {
			log.error(ex.getMessage());
		}

	}

	/**
	 * 会签
	 * 
	 * @param request
	 * @param frm
	 * @return
	 */
	public boolean submitMoreDoc(HttpServletRequest request, SubmitForm frm) {
		try {
			daoMgr.startTransaction();
			Authorization authorization = (Authorization) request.getSession()
					.getAttribute("authorization");

			java.util.StringTokenizer token = new java.util.StringTokenizer(frm
					.getFlowids(), ";");
			String strUserName = getConterSignProcessorids(frm.getFlowids());
			java.util.StringTokenizer tokenUser = new java.util.StringTokenizer(
					frm.getName(), "*");// ID:NAME*
			StringBuffer userBuffer = new StringBuffer();
			StringBuffer useridBuffer = new StringBuffer();
			while (token.hasMoreTokens()) {
				Integer flowsid = Integer.parseInt(token.nextToken());
				while (tokenUser.hasMoreTokens()) {
					String iDAUserName = tokenUser.nextToken();
					String[] splitIDAUserName = iDAUserName.split(":");
					String userid = splitIDAUserName[0];
					useridBuffer.append(userid).append(";");
					String userName = splitIDAUserName[1];
					userBuffer.append(userName).append("*");
					Flows flows = dao.getFlows(flowsid);
					flows.setProcessorid(Integer.parseInt(userid));
					flows.setPowergroup(frm.getPowerid());
					dao.updateDocNew(flows);
					flows.setFatherid(flowsid);
					flows.setPowergroup(frm.getPowerid());
					flows.setProcessorid(Integer.parseInt(userid));
					flows.setStatus("会签");
					flows.setVersion(1);
					flows.setFlowName("counterSign"); // 标识流程节点名称
					flows.setOperationtor(authorization.getName());// 标识当前节点是由谁送过来的
					flows.setFlowtor(userName); // 标识当前流程节点是由谁来负责操作.
					flows.setFlag(2);
					dao.addFlows(flows);
				}
				Flows flows = dao.getFlows(flowsid);
				flows.setStatus("送会签");
				flows.setOperationtor(strUserName + userBuffer.toString());
				flows.setFlag(5);
				java.text.SimpleDateFormat dateformat = new java.text.SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				flows.setOpertime(dateformat.format(new Date()));
				flows.setVersion(1);
				dao.updateFlows(flows);
			}
			if (frm.getEmail() == 1) {
				sendEmail(frm, useridBuffer.toString());
			}
			if (frm.getMessage() == 1) {
				sendIM(frm, useridBuffer.toString());
			}
			daoMgr.commitTransaction();

		} catch (Exception ex) {
			log.error("公文提交失败" + ex.getMessage());
			return false;
		} finally {
			daoMgr.endTransaction();
		}

		return true;
	}

	public boolean checkSubmitDoc(String flowsid) {
		try {
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					flowsid, ";");
			while (token.hasMoreTokens()) {
				if (dao.checkSubmitDoc(Integer.parseInt(token.nextToken())) > 0)
					return false;
			}
			return true;
		} catch (Exception ex) {
			log.error(ex.getMessage());
			return false;
		}
	}

	public boolean checkCounterSignISSubmit(String flowsid) {
		try {
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					flowsid, ";");
			while (token.hasMoreTokens()) {
				if (dao.checkCounterSignISSubmit(Integer.parseInt(token
						.nextToken())) > 0)
					return false;
			}
			return true;
		} catch (Exception ex) {
			log.error(ex.getMessage());
			return false;
		}
	}

	public boolean checkCounterSign(String flowsid) {
		try {
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					flowsid, ";");
			while (token.hasMoreTokens()) {
				if (dao.checkCounterSign(Integer.parseInt(token.nextToken())) > 0)
					return false;
			}
			return true;
		} catch (Exception ex) {
			log.error(ex.getMessage());
			return false;
		}
	}

	public int withDrawDoc(HttpServletRequest request, String flowsid) {
		try {

			Authorization authorization = (Authorization) request.getSession()
					.getAttribute("authorization");
			String powergroup = (String) request.getSession()
					.getAttribute("pg");
			daoMgr.startTransaction();
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					flowsid, ";");
			while (token.hasMoreTokens()) {
				Integer flowid = Integer.parseInt(token.nextToken());
				if (dao.checkWithDrawDoc(flowid) > 0)
					return 2;
				if (dao.checkWithDrawDocSelf(flowid) > 0)
					return 3;
				if (dao.checkOpenStatus(flowid) > 0)
					return 4;

			}
			token = new java.util.StringTokenizer(flowsid, ";");
			while (token.hasMoreTokens()) {

				Integer flowid = Integer.parseInt(token.nextToken());
				Integer leafid = dao.selectLeafFlow(flowid);
				Flows flows = dao.getFlows(flowid);
				flows.setPowergroup(Integer.parseInt(powergroup));
				flows.setStatus("已撤回");
				// flows.setFlowName("撤回");//只标识流程
				flows.setProcessorid(authorization.getLeaderid());
				flows.setFlag(0);

				flows.setVersion(1);
				flows.setOperationtor(authorization.getName());
				flows.setFlowtor(authorization.getName());
				dao.addFlows(flows);
				flows = dao.getFlows(leafid);
				flows.setVersion(0);
				flows.setStatus("已撤回");
				flows.setAdvice("");
				flows.setFlag(4);
				java.text.SimpleDateFormat dateformat = new java.text.SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				flows.setOpertime(dateformat.format(new Date()));
				flows.setOperationtor(authorization.getName());
				dao.updateFlows(flows);
				flows = dao.getFlows(flowid);
				flows.setFlag(4);
				flows.setVersion(0);
				dao.updateFlows(flows);
			}

			daoMgr.commitTransaction();
			return 1;
		} catch (Exception ex) {
			log.error("撤回公文错误" + ex.getMessage());
			return 0;
		} finally {
			daoMgr.endTransaction();
		}
	}

	public List getFlowsRecord(int docid) {
		try {
			return dao.getFlowsRecord(docid);
		} catch (Exception ex) {
			log.error("查询公文流程记录错误" + ex.getMessage());
			return null;
		}
	}

	public boolean getCheckModify(int docid, HttpServletRequest request) {
		synchronized (lock) {
			try {
				if (dao.checkModify(docid) > 0) {

					return false;
				} else {
					Authorization authorization = (Authorization) request
							.getSession().getAttribute("authorization");
					Watches watches = new Watches();
					watches.setUserid(authorization.getUserid());
					watches.setDocid(docid);
					dao.updateCheckModify(watches);
					return true;
				}
			} catch (Exception ex) {
				log.error(ex.getMessage());
				return false;
			}
		}
	}

	public void updateUnCheckModify(int docid, HttpServletRequest request) {
		try {
			Authorization authorization = (Authorization) request.getSession()
					.getAttribute("authorization");
			Watches watches = new Watches();
			watches.setUserid(authorization.getUserid());
			watches.setDocid(docid);
			dao.updateUnCheckModify(watches);
		} catch (Exception ex) {
			log.error("更新公文锁定状态错误" + ex.getMessage());
		}
	}

	public Integer getMaxAttacheID() {
		try {
			Integer attacheid = dao.getMaxAttacheID();
			return attacheid == null ? 1 : attacheid + 1;
		} catch (Exception ex) {
			log.error("获取符件最大ID错误" + ex.getMessage());
			return 10;
		}
	}

	public void delDocAttachments(Integer attachid) {
		try {
			dao.deleteAttache(attachid);
		} catch (Exception ex) {
			log.error("删除公文附件错误" + ex.getMessage());
		}
	}

	public boolean chekcRejectModifyDoc(String flowids) {
		java.util.StringTokenizer token = new java.util.StringTokenizer(
				flowids, ";");
		try {
			while (token.hasMoreTokens()) {
				Integer flowid = Integer.parseInt(token.nextToken());
				if (dao.checkRejectModifyDoc(flowid) > 0)
					return true;

			}
			return false;

		} catch (Exception ex) {
			log.error(ex.getMessage());
			return false;
		}
	}

	public boolean chekcRejectDoc(String flowids) {
		java.util.StringTokenizer token = new java.util.StringTokenizer(
				flowids, ";");
		try {
			while (token.hasMoreTokens()) {
				Integer flowid = Integer.parseInt(token.nextToken());
				if (dao.checkRejectDoc(flowid) > 0)
					return true;

			}
			return false;

		} catch (Exception ex) {
			log.error(ex.getMessage());
			return false;
		}
	}

	public boolean chekcIsCounterSign(String flowids) {
		java.util.StringTokenizer token = new java.util.StringTokenizer(
				flowids, ";");
		try {
			while (token.hasMoreTokens()) {
				Integer flowid = Integer.parseInt(token.nextToken());
				if (dao.chekcIsCounterSign(flowid) > 0)
					return true;

			}
			return false;

		} catch (Exception ex) {
			log.error(ex.getMessage());
			return false;
		}
	}

	public boolean counterSignDoc(SubmitForm frm, HttpServletRequest request) {

		try {

			Authorization authorization = (Authorization) request.getSession()
					.getAttribute("authorization");
			daoMgr.startTransaction();
			String flowsid = frm.getFlowids();

			String advice = frm.getAdvice();
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					flowsid, ";");
			while (token.hasMoreTokens()) {
				Integer flowid = Integer.parseInt(token.nextToken());

				Flows flows = dao.getFlows(flowid);
				flows.setStatus("完成会签");
				flows.setFlag(1);
				flows.setOperationtor(authorization.getName());
				java.text.SimpleDateFormat dateformat = new java.text.SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				flows.setOpertime(dateformat.format(new Date()));
				flows.setAdvice(advice);
				dao.updateFlows(flows);
			}
			String adviceFlag = request.getParameter("adviceFlag");
			if (adviceFlag.equals("1") && !frm.getAdvice().trim().equals("")) {
				UserService service = new UserService();
				Advice adviceObject = new Advice();
				adviceObject.setUserid(authorization.getUserid());
				adviceObject.setAdvice(advice);
				service.addAdvice(adviceObject);
			}
			daoMgr.commitTransaction();
			return true;

		} catch (Exception ex) {
			log.error(ex.getMessage());
			return false;
		} finally {
			daoMgr.endTransaction();
		}

	}

	public boolean RejectDoc(SubmitForm frm, HttpServletRequest request) {

		try {
			Authorization authorization = (Authorization) request.getSession()
					.getAttribute("authorization");
			daoMgr.startTransaction();
			String flowsid = frm.getFlowids();
			String advice = frm.getAdvice();
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					flowsid, ";");
			while (token.hasMoreTokens()) {
				Integer flowid = Integer.parseInt(token.nextToken());
				Integer fatherid = dao.selectParentFlows(flowid);
				Flows flows = dao.getFlows(fatherid);
				flows.setFlag(3);
				flows.setVersion(0);
				dao.updateFlows(flows);
				// flows.setFatherid(flowid);
				// flows.setFlowName("驳回");
				flows.setStatus("已驳回");
				flows.setFlag(0);
				flows.setOperationtor(authorization.getName());
				java.text.SimpleDateFormat dateformat = new java.text.SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				flows.setOpertime(dateformat.format(new Date()));
				flows.setVersion(1);
				flows.setAdvice(advice);
				dao.addFlows(flows);
				flows = dao.getFlows(flowid);
				// flows.setVersion(1);
				flows.setStatus("驳回");
				flows.setFlag(3);
				flows.setAdvice(advice);
				flows.setOpertime(dateformat.format(new Date()));
				dao.updateFlows(flows);
			}
			String adviceFlag = request.getParameter("adviceFlag");
			if (adviceFlag.equals("1") && !frm.getAdvice().trim().equals("")) {
				UserService service = new UserService();
				Advice adviceObject = new Advice();
				adviceObject.setUserid(authorization.getUserid());
				adviceObject.setAdvice(advice);
				service.addAdvice(adviceObject);
			}
			daoMgr.commitTransaction();
			return true;

		} catch (Exception ex) {
			log.error(ex.getMessage());
			return false;
		} finally {
			daoMgr.endTransaction();
		}

	}

	public String getConterSignProcessorids(String flowsid) {
		try {
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					flowsid, ";");
			StringBuffer bufferName = new StringBuffer();
			while (token.hasMoreTokens()) {
				List list = dao.getConterSignProcessorids(Integer
						.parseInt(token.nextToken()));
				Iterator itera = list.iterator();
				while (itera.hasNext()) {
					User user = (User) itera.next();
					bufferName.append(user.getName()).append("*");

				}

			}
			return bufferName.toString();
		} catch (Exception ex) {
			log.error(ex.getMessage());
			return "";
		}

	}

	public List getCounterUserInfo(String flowsid) {
		try {
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					flowsid, ";");
			List list = new ArrayList();
			while (token.hasMoreTokens()) {
				list.add(dao.getConterSignProcessorids(Integer.parseInt(token
						.nextToken())));
			}
			return list;
		} catch (Exception ex) {
			log.error(ex.getMessage());
			return null;
		}
	}

	public boolean auditFinish(SubmitForm frm, HttpServletRequest request) {
		try {
			daoMgr.startTransaction();
			java.util.StringTokenizer token = new java.util.StringTokenizer(frm
					.getFlowids(), ";");
			Authorization authorization = (Authorization) request.getSession()
					.getAttribute("authorization");
			while (token.hasMoreTokens()) {
				Integer flowid = Integer.parseInt(token.nextToken());
				if (!checkCounterSignISSubmit(String.valueOf(flowid) + ";")) {
					updateConterSignStatus(flowid, "公文已签批,未完成会签", authorization
							.getName());
				}
				Flows flows = dao.getFlows(flowid);
				flows.setFatherid(flowid);
				flows.setFlag(0);
				flows.setFlowName("审批完毕");
				User user = dao.getDocCreator(flows.getDocid());
				flows.setFlowtor(user.getName());
				flows.setOperationtor(authorization.getName());
				flows.setPowergroup(6);
				flows.setProcessorid(user.getUserid());
				flows.setStatus("审批完毕");
				flows.setVersion(1);
				dao.addFlows(flows);
				java.text.SimpleDateFormat dateformat = new java.text.SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				flows.setOpertime(dateformat.format(new Date()));
				flows.setStatus("签批");
				flows.setFlag(1);
				flows.setAdvice(frm.getAdvice());
				flows.setOperationtor(user.getName());
				dao.updateFlows(flows);
			}
			String adviceFlag = request.getParameter("adviceFlag");
			if (adviceFlag.equals("1") && !frm.getAdvice().trim().equals("")) {
				UserService service = new UserService();
				Advice adviceObject = new Advice();
				adviceObject.setUserid(authorization.getUserid());
				adviceObject.setAdvice(frm.getAdvice());
				service.addAdvice(adviceObject);
			}
			daoMgr.commitTransaction();
			return true;
		} catch (Exception ex) {
			log.error(ex.getMessage());
			return false;

		} finally {
			daoMgr.endTransaction();
		}
	}

	public boolean withDrowCounterSignUser(String flowsid, String userids,
			HttpServletRequest request) {

		try {
			Authorization authorization = (Authorization) request.getSession()
					.getAttribute("authorization");
			daoMgr.startTransaction();
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					flowsid, ";");
			java.util.StringTokenizer tokenUser = new java.util.StringTokenizer(
					userids, ";");
			Flows flows = new Flows();
			flows.setOperationtor(authorization.getName());
			flows.setFlag(6);
			while (token.hasMoreTokens()) {
				Integer flowid = Integer.parseInt(token.nextToken());
				while (tokenUser.hasMoreTokens()) {
					flows.setId(flowid);
					flows.setProcessorid(Integer
							.parseInt(tokenUser.nextToken()));
					flows.setStatus("会签撤回");
					dao.withDrowCounterSignUser(flows);

				}
				tokenUser = new java.util.StringTokenizer(userids, ";");

			}

			daoMgr.commitTransaction();
			return true;

		} catch (Exception ex) {
			log.error(ex.getMessage());
			return false;
		} finally {
			daoMgr.endTransaction();
		}

	}

	public boolean docNumOper(DocNumOperForm frm) {
		try {
			DocTypesService service = new DocTypesService();
			daoMgr.startTransaction();
			DocEntity docEntity = dao.getDoc(frm.getDocid());
			docEntity.setDocid(frm.getDocid());
			docEntity.setDocnum(frm.getDocNum());
			dao.updateDoc(docEntity);
			DocNum docNum = service.getDocNum(frm.getDoctypeid());
			Integer nextNum = docNum.getNextnum() + 1;
			docNum.setNextnum(nextNum);
			service.saveDocNum(docNum);

			daoMgr.commitTransaction();
			return true;

		} catch (Exception ex) {
			log.error(ex.getMessage());
			return false;
		} finally {
			daoMgr.endTransaction();
		}
	}

	public boolean backUpDoc(String flowsid, HttpServletRequest request) {
		try {
			daoMgr.startTransaction();

			Authorization authorization = (Authorization) request.getSession()
					.getAttribute("authorization");
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					flowsid, ";");
			java.text.SimpleDateFormat dateformat = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			while (token.hasMoreTokens()) {
				Integer flowid = Integer.parseInt(token.nextToken());
				Flows flows = dao.getFlows(flowid);
				/*
				 * flows.setId(flowid); flows.setStatus("已归档");
				 * flows.setOperationtor(authorization.getName());
				 * flows.setAdvice(""); flows.setFlag(8);
				 * flows.setOpertime(dateformat.format(new Date()));
				 * flows.setVersion(0); dao.updateFlows(flows);
				 */

				flows.setProcessorid(authorization.getLeaderid());
				dao.updateFlowsBackUpFlag(flows);
				flows.setProcessorid(authorization.getLeaderid());
				flows.setPowergroup(8);
				flows.setFatherid(flowid);
				flows.setAdvice("");
				flows.setStatus("已归档");
				flows.setVersion(1);
				flows.setFlowName("归档"); // 标识流程节点名称
				flows.setOperationtor(authorization.getName());// 标识当前节点是由谁送过来的
				flows.setFlowtor(authorization.getName()); // 标识当前流程节点是由谁来负责操作.
				flows.setFlag(8);
				dao.addFlows(flows);

			}
			daoMgr.commitTransaction();
			return true;
		} catch (Exception ex) {
			log.error(ex.getMessage());
			return false;
		} finally {
			daoMgr.endTransaction();
		}
	}

	public boolean delGarbage(String flowsid) {
		try {

			daoMgr.startTransaction();
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					flowsid, ";");
			ParameterService service = new ParameterService();
			Parameter parameter = service.listParameter();
			File file = null;
			while (token.hasMoreTokens()) {
				Integer flowid = Integer.parseInt(token.nextToken());
				Flows flows = dao.getFlows(flowid);
				DocEntity entity = dao.getDoc(flows.getDocid());
				List list = dao.getDocAttache(flows.getDocid());
				Iterator iter = list.iterator();
				while (iter.hasNext()) {
					Attache attache = (Attache) iter.next();
					String attachePath = parameter.getAttacheip()
							+ attache.getFilename();
					attachePath = attachePath.replace("\\", "\\\\");
					file = new File(attachePath);
					if (file.exists())
						file.delete();
					dao.deleteAttache(attache.getAttacheid());
				}
				String docPath = parameter.getContentip() + entity.getContent();
				docPath = docPath.replace("\\", "\\\\");
				file = new File(docPath);
				if (file.exists())
					file.delete();

				dao.delGarbage(flows.getDocid());
			}
			daoMgr.commitTransaction();
			return true;
		} catch (Exception ex) {
			log.error(ex.getMessage());
			return false;
		} finally {
			daoMgr.endTransaction();
		}
	}

	public List getPowerGroupAdvice(DocFlowsKeyWord keyword) {
		try {
			return dao.getPowerGroupAdvice(keyword);
		}

		catch (Exception ex) {
			log.error(ex.getMessage());
			return null;
		}
	}

	public List getPowerGroupAdviceLeader(DocFlowsKeyWord keyword) {
		try {
			return dao.getPowerGroupAdviceLeader(keyword);
		}

		catch (Exception ex) {
			log.error(ex.getMessage());
			return null;
		}
	}

	public List getSounterSignAdvice(DocFlowsKeyWord keyword) {
		try {
			return dao.getSounterSignAdvice(keyword);
		}

		catch (Exception ex) {
			log.error(ex.getMessage());
			return null;
		}
	}

	public List getTaskList(DocFlowsKeyWord keyword) {
		try {
			return dao.getTaskList(keyword);
		}

		catch (Exception ex) {
			log.error(ex.getMessage());
			return null;
		}
	}

	public Integer getTaskListCount(DocFlowsKeyWord keyword) {
		try {
			return dao.getTaskListCount(keyword);
		}

		catch (Exception ex) {
			log.error(ex.getMessage());
			return null;
		}
	}

	public String getFinisher(Integer docid) {
		try {
			return dao.getFinisher(docid);
		}

		catch (Exception ex) {
			log.error(ex.getMessage());
			return null;
		}
	}

	public void setReadFlag(Flows flows) {
		try {
			dao.setReadFlag(flows);
		}

		catch (Exception ex) {
			log.error(ex.getMessage());

		}
	}
	public String getDocTitle(int flowid)
	{
		try
		{
			return dao.getDocTitle(flowid);
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
		}
		return "";
	}

	public String getAuditor(int docid) {
		try {

			DocEntity docEntity = dao.getDoc(docid);
			List list = dao.getAuditor(docid);
			Iterator iter = list.iterator();
			StringBuffer buffer = new StringBuffer();
			while (iter.hasNext()) {
				Flows flows = (Flows) iter.next();
				if (docEntity.getCreator().contains(flows.getOperationtor())) {
					continue;
				}
				buffer.append(flows.getOperationtor()).append(",");
			}
			String tempBuffer = buffer.toString();
			if (tempBuffer.equals(""))
				return "";
			return tempBuffer.substring(0, tempBuffer.lastIndexOf(","));
		}

		catch (Exception ex) {
			log.error(ex.getMessage());
			return null;
		}
	}
}
