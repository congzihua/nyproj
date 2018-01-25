package com.founder.enp.util.databases;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ConnectionManager
{

    private ConnectionManager()
        throws SQLException
    {
        _dataSource = null;
        initDataSource();
    }
    private void initDataSource()
        throws SQLException
    {
        try
        {
            String JNDIDataSource = null;
            try
            {
                JNDIDataSource = ConfigManager.getConfigProperty("DataSource.JNDIDataSource");
            }
            catch(Exception ex3)
            {
                log.error("\u5728GwlzConfig.properties\u4E2D\u6CA1\u6709\u53D6\u5230JNDIDataSource\u914D\u7F6E\u9879");
            }
            Context ctx = null;
            ctx = new InitialContext();
            _dataSource = (DataSource)ctx.lookup(JNDIDataSource);
        }
        catch(Exception ex)
        {
            log.warn("Init DataSource Error : ", ex);
            throw new SQLException((new StringBuilder("Init DataSource Error : ")).append(ex).toString());
        }
    }

    public static ConnectionManager getInstance()
        throws SQLException
    {
        if(_connectionManager == null)
            _connectionManager = new ConnectionManager();
        return _connectionManager;
    }

    public Connection getConnection()
        throws SQLException
    {
        Connection conn = null;
        try
        {
            conn = _dataSource.getConnection();
        }
        catch(Exception ex)
        {
            log.warn("\u65E0\u6CD5\u53D6\u5F97\u6570\u636E\u5E93\u8FDE\u63A5", ex);
            throw new SQLException("\u65E0\u6CD5\u53D6\u5F97\u6570\u636E\u5E93\u8FDE\u63A5");
        }
        return conn;
    }

    public DataSource getDataSource()
        throws SQLException
    {
        if(_dataSource == null)
            initDataSource();
        return _dataSource;
    }

    private static Log log = LogFactory.getLog(ConnectionManager.class);
    private DataSource _dataSource;
    private static ConnectionManager _connectionManager = null;

}
