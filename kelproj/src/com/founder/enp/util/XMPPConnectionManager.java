/*package com.founder.enp.util;


import org.jivesoftware.smack.XMPPConnection;

public class XMPPConnectionManager {

	private static XMPPConnectionManager _connectionManager = null;

	private static XMPPConnection connection;

	private XMPPConnectionManager() throws Exception {
		connection = null;
		initConnection();
	}

	private void initConnection() throws Exception {
		String domain = com.founder.enp.util.ConfigManager
				.getConfigProperty("im.domain");
		String account = com.founder.enp.util.ConfigManager
				.getConfigProperty("im.account");
		String password = com.founder.enp.util.ConfigManager
				.getConfigProperty("im.password");
		connection = new XMPPConnection(domain);
		connection.connect();// 先连接服务器
		connection.login(account, password);// 使用openfire的注册用户登录
	}

	public static XMPPConnectionManager getInstance() throws Exception {
		if (_connectionManager == null)
			_connectionManager = new XMPPConnectionManager();
		return _connectionManager;
	}

	public XMPPConnection getConnection() throws Exception {
		if (connection == null)
			initConnection();
		return connection;
	}

}
*/