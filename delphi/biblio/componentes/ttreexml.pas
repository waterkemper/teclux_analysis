unit ttreexml;
// treeview to XML, XML to treeview by Glenn1234,
// may be used with proper credit given
interface
  uses msxml2_tlb, comctrls, dialogs, sysutils;

type
// saves TTreeView as XML file.
TTreeViewToXML = class
  private
    doc: IXMLDOMDocument;
    FTree: TTreeView;

    procedure XMLPopulate(BaseNode: TTreeNode; DataItem: IXMLDOMelement);
  Public
    Constructor Create(Tree: TTreeView);
    procedure SaveToFile(filename: string);
  end;

// loads TTreeView from XML file
TXMLToTreeView = class
  private
    doc: IXMLDOMDocument;
    FTree: TTreeView;

    procedure XMLLoad(BaseItem: TTreeNode; DataItem: IXMLDOMNode);
  Public
    Procedure XMLToTree(Tree: TTreeView; Const FileName: String);
  end;


implementation
constructor TTreeViewToXML.Create(Tree: TTreeView);
begin
  FTree := Tree;
end;

procedure TTreeViewToXML.XMLPopulate(BaseNode: TTreeNode; DataItem: IXMLDOMelement);
var
  SubItem: IXMLDOMElement;
  selnode: TTreeNode;
begin
  SelNode := BaseNode;
  while selnode <> nil do
    begin
      if SelNode.HasChildren then
        begin
          SubItem := doc.CreateElement('Group');
          SubItem.setAttribute('Value', SelNode.Text);
          DataItem.AppendChild(SubItem);
          XMLPopulate(SelNode.GetFirstChild, SubItem);
        end
      else
        begin
          SubItem := doc.CreateElement('Item');
          SubItem.setAttribute('Value', SelNode.Text);
          DataItem.AppendChild(SubItem);
        end;
      SelNode := SelNode.GetNextChild(SelNode);
    end;
end;

procedure TTreeViewToXML.SaveToFile(filename: string);
 var
   topnode: IXMLDOMElement;
   selnode: TTreeNode;
 begin
   //create DOM document instance
   doc := CoDOMDocument.Create;
   doc.async := false;
//------------------------------------------------------------------------------
   topnode := doc.createElement('TreeView');
   doc.appendChild(topnode);
   selnode := FTree.Items.GetFirstNode;
   XMLPopulate(SelNode, topnode);
   doc.save(FileName);
 end;

 procedure TXMLToTreeView.XMLLoad(BaseItem: TTreeNode; DataItem: IXMLDOMNode);
   var
     item1, item2: IXMLDOMNode;
     attr: IXMLDOMNamedNodeMap;
     CurrItem: TTreeNode;
   begin
     Item1 := DataItem;
     CurrItem := nil;   // compiler complains if I don't do this
     while Item1 <> nil do
       begin
         attr := item1.attributes;
         item2 := attr.nextNode;
         while item2 <> nil do
           begin
             CurrItem := FTree.Items.AddChild(BaseItem, Item2.NodeValue);
             item2 := attr.nextNode;
           end;
         if item1.nodename = 'Group' then
           XMLLoad(CurrItem, Item1.Get_firstChild);
         Item1 := Item1.Get_nextSibling;
       end;
   end;

   Procedure TXMLToTreeView.XMLToTree(Tree: TTreeView; Const FileName: String);
    var
      item1: IXMLDOMNode;
    begin
     //create DOM document instance
      doc := CoDOMDocument.Create;
      doc.async := false;
      FTree := Tree;
     //------------------------------------------------------------------------------
      if doc.load(FileName) then
        begin
          FTree.Items.BeginUpdate;
          FTree.Items.Clear;
          Item1 := doc.documentElement.Get_firstChild;
          XMLLoad(nil, Item1);
          FTree.Items.EndUpdate;
        end
      else
        begin
          MessageDlg(Format ('Error loading XML document.'#13 +
                             'Error number: %d'#13 +
                             'Reason: %s'#13 +
                             'Line: %d'#13 +
                             'Column: %d', [doc.parseError.errorCode,
                             doc.parseError.reason,
                             doc.parseError.line,
                             doc.parseError.linePos]), mtError, [mbOK], 0);
        end;
    end;
 end.