// Decompiled by Jad v1.5.8f. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   EcphGlobal.java

package com.founder.enp.util;


public class Global
{

    public Global()
    {
    }

    public static int computePageCount(int recordCount)
    {
        if(recordCount == 0)
            return 1;
        else
            return (int)Math.ceil((double)recordCount / 20D);
    }
    public static int computePageCount(int recordCount,int number)
    {
        if(recordCount == 0)
            return 1;
        else
            return (int)Math.ceil((double)recordCount / number);
    }
}
