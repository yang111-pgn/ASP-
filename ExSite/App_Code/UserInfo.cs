using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// UserInfo类包含Name和Birthday两个属性及一个DecideAge()方法
/// </summary>
public class UserInfo
{
    /// <summary>
    /// 定义Name属性
    /// </summary>
    public string Name { get; set; }

    /// <summary>
    /// 定义Birthday属性
    /// </summary>
    public DateTime Birthday { get; set; }

    /// <summary>
    /// 定义构造函数
    /// </summary>
    /// <param name="name">姓名</param>
    /// <param name="birthday">生日</param>
    public UserInfo(string name, DateTime birthday)
    {
        Name = name;
        Birthday = birthday;
    }

    /// <summary>
    /// 判断是否成年的方法
    /// </summary>
    /// <returns>返回判断结果</returns>
    public string DecideAge()
    {
        if (DateTime.Now.Year - Birthday.Year < 18)
        {
            return Name + "，您还没长大呢？";
        }
        else
        { 
            return Name + "，您是成人了！";
        }
    }
}