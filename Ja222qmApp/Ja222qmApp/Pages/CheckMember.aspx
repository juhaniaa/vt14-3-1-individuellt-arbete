﻿<%@ Page Title="Medlems detaljer" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckMember.aspx.cs" Inherits="Ja222qmApp.Pages.CheckMember" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
                <h2>Ordets magnifika medlems applikation</h2>
            </hgroup>            
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
    <asp:ValidationSummary runat="server" />

    <%-- Meddelande för lyckad operation --%>
    <asp:PlaceHolder runat="server" ID="MessagePlaceholder" Visible="false">
        <asp:Literal runat="server" ID="MessageLiteral"></asp:Literal>
    </asp:PlaceHolder>

    <%-- Visar den specifika medlemmens info --%>

    <asp:FormView ID="MemberFormView" runat="server" ItemType="Ja222qmApp.Model.Member"
         SelectMethod="MemberFormView_GetItem" RenderOuterTable="false">
        <ItemTemplate>
            <div>
                <label for="Name">Namn</label>
            </div>
            <div>
                <%#: Item.Name %>
            </div>

            <div>
                <label for="Address">Adress</label>
            </div>
            <div>
               <%#: Item.Address %>
            </div>

            <div>
                <label for="PostalCode">Postnummer</label>
            </div>
            <div>
                <%#: Item.Postnr %>
            </div>

            <div>
                <label for="City">Ort</label>
            </div>
            <div>
                <%#: Item.City %>
            </div>

            <div>
                <asp:HyperLink runat="server" Text="Redigera" NavigateUrl='<%# GetRouteUrl("EditMember", new { id = Item.MemberId }) %>' />
                <asp:HyperLink runat="server" Text="Ta bort" NavigateUrl='<%# GetRouteUrl("DeleteMember", new { id = Item.MemberId }) %>' />
                <asp:HyperLink runat="server" Text="Avbryt" NavigateUrl='<%# GetRouteUrl("Members", null)%>' />
            </div>
        </ItemTemplate>

    </asp:FormView>
    <hr />

    <%-- Lista på den specifika medlemmens ansvarsområden --%>

    <label for="Areas">Ansvarsområden</label>

    <asp:ListView ID="AreaListView" runat="server" 
        ItemType="Ja222qmApp.Model.Helper" SelectMethod="AreaListView_GetData"
        DataKeyNames="HelperId">        
        <LayoutTemplate>            
            <asp:PlaceHolder ID="itemPlaceholder" runat="server"/>
        </LayoutTemplate>
        <ItemTemplate>

            <dl>
                <dt>
                    <%#: Item.HelperAreaName %>
                    <asp:LinkButton ID="DeleteAreaButton" runat="server" Text="Ta bort"
                         OnCommand="DeleteAreaButton_Command" CommandArgument='<%# Item.HelperId %>'></asp:LinkButton>
                </dt>           
            </dl>
    
        </ItemTemplate>         
    </asp:ListView>

    <%-- Dropdown lista för att lägga till nytt ansvars till den specifika medlemmen --%>
    
    <asp:DropDownList ID="AreaDropDownList" runat="server" 
        SelectMethod="AreaDropDownList_GetData" AppendDataBoundItems="true"
        DataTextField="AreaName"
        DataValueField="AreaId">
        <asp:ListItem Selected="True" Text="Nytt ansvar..." value=0></asp:ListItem>
    </asp:DropDownList>    
        
    <%-- Knapp för att bekräfta --%>
    <asp:LinkButton ID="AddAreaButton" runat="server" Text="Lägg till"
                         OnCommand="AddAreaButton_Command" CommandArgument='<%$ RouteValue:id %>'></asp:LinkButton>

</asp:Content>
