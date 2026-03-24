using System;
using System.Web.UI.WebControls;

public partial class Chap4_ListBox : System.Web.UI.Page
{
    protected void BtnMoveRight_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < lstLeft.Items.Count; i++)
        {
            if (lstLeft.Items[i].Selected)
            {
                lstRight.Items.Add(lstLeft.Items[i]);
                lstLeft.Items.Remove(lstLeft.Items[i]);
                i--;

            }
        }
    }

    protected void BtnMoveLeft_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < lstRight.Items.Count; i++)
        {
            if (lstRight.Items[i].Selected)
            {
                lstLeft.Items.Add(lstRight.Items[i]);
                lstRight.Items.Remove(lstRight.Items[i]);
                i--;
            }
        }
    }
}