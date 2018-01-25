
package com.founder.enp.persistence;


public class PaginatedModel
{

    public PaginatedModel()
    {
        startNumber = 0;
        endNumber = 0;
    }

    public int getEndNumber()
    {
        return endNumber;
    }

    public void setEndNumber(int end)
    {
        endNumber = end;
    }

    public int getStartNumber()
    {
        return startNumber;
    }

    public void setStartNumber(int start)
    {
        startNumber = start;
    }

    public void setPageInfo(int pageSize, int currentPage)
    {
        startNumber = (currentPage - 1) * pageSize;
        endNumber =  pageSize;
    }

    protected int startNumber;
    protected int endNumber;
}
