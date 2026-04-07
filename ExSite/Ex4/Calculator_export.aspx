<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calculator_export.aspx.cs" Inherits="Ex4_Calculator_export" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            简易计算器<br />
            <asp:TextBox ID="txtDisplay" runat="server" ReadOnly="True" Width="110px"></asp:TextBox>
        </div>

        <asp:Button ID="btnOne" runat="server" OnClick="btnOne_Click" Text="1" Width="40px" />
        <asp:Button ID="btnTwo" runat="server" OnClick="btnTwo_Click" Text="2" Width="40px" />
        <asp:Button ID="btnThree" runat="server" OnClick="btnThree_Click" Text="3" Width="40px" />
        <p>
        <asp:Button ID="btnFour" runat="server" OnClick="btnFour_Click" Text="4" Width="40px" />
        <asp:Button ID="btnFive" runat="server" OnClick="btnFive_Click" Text="5" Width="40px" />
        <asp:Button ID="btnSix" runat="server" OnClick="btnSix_Click" Text="6" Width="40px" />
        </p>
        <p>
        <asp:Button ID="btnSeven" runat="server" OnClick="btnSeven_Click" Text="7" Width="40px" />
        <asp:Button ID="btnEight" runat="server" OnClick="btnEight_Click" Text="8" Width="40px" />
        <asp:Button ID="btnNine" runat="server" OnClick="btnNine_Click" Text="9" Width="40px" />
        </p>
        <p>
        <asp:Button ID="btnZero" runat="server" OnClick="btnZero_Click" Text="0" Width="40px" />
        <asp:Button ID="btnDot" runat="server" OnClick="btnDot_Click" Text="." Width="40px" />
        <asp:Button ID="btnCE" runat="server" OnClick="btnCE_Click" Text="CE" Width="40px" />
        </p>
        <p>
            <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="+" Width="40px" />
            <asp:Button ID="btnSubtract" OnClick="btnSubtract_Click" runat="server" Text="-" Width="40px" />
            <asp:Button ID="btnMultiply" OnClick="btnMultiply_Click" runat="server" Text="×" Width="40px" />
            <asp:Button ID="btnDivide" OnClick="btnDivide_Click" runat="server" Text="÷" Width="40px" />
        </p>
        <p>
            <asp:Button ID="btnSin" OnClick="btnSin_Click" runat="server" Text="sin" Width="40px" />
            <asp:Button ID="btnSquare" OnClick="btnSquare_Click" runat="server" Text="x²" Width="40px" />
            <asp:Button ID="btnEqual" OnClick="btnEqual_Click" runat="server" Text="=" Width="40px" />
        </p>
    </form>
</body>
</html>
