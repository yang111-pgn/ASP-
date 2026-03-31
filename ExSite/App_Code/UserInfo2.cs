using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// UserInfo类包含Name和Birthday两个属性及一个DecideAge()方法
/// </summary>
public class UserInfo2
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
    /// 构造函数
    /// </summary>
    /// <param name="name">姓名</param>
    /// <param name="birthday">生日</param>
    public UserInfo2(string name, DateTime birthday)
    {
        Name = name;
        Birthday = birthday;
    }

    /// <summary>
    /// 计算年龄的方法
    /// </summary>
    /// <returns>年龄</returns>
    public int DecideAge()
    {
        int age = DateTime.Now.Year - Birthday.Year;
        // 若当前日期未过当年生日，年龄减1
        if (DateTime.Now.Month < Birthday.Month ||
            (DateTime.Now.Month == Birthday.Month && DateTime.Now.Day < Birthday.Day))
        {
            age--;
        }
        return age;
    }

    /// <summary>
    /// 生日校验事件
    /// </summary>
    public event Action<string> ValidateBirthday;

    /// <summary>
    /// 触发生日校验的方法
    /// </summary>
    public void OnValidateBirthday()
    {
        DateTime minDate = new DateTime(1900, 1, 1);
        if (Birthday > DateTime.Now || Birthday < minDate)
        {
            ValidateBirthday?.Invoke($"生日{Birthday:yyyy-MM-dd}不合法，需在1900-01-01至当前日期之间");
        }
    }
}