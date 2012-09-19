package
{
    import fl.controls.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;

    dynamic public class Main extends MovieClip
    {
        public var Btn:Button;
        public var v:Number;
        public var fpro:ProgressBar;
        public var Text:TextArea;
        public var pro:ProgressBar;
        public var File:FileReferenceList;
        public var upBtn:Button;

        public function Main()
        {
            addFrameScript(0, frame1);
        }

        public function Brower(param1)
        {
            File.browse([new FileFilter("图片文件", "*.jpg;*.gif;*.bmp;*.png"), new FileFilter("Office文件", "*.doc;*.xls"), new FileFilter("文件压缩包", "*.zip;*.rar")]);
        }

        public function showfpro(param1):void
        {
            fpro.setProgress(param1.bytesLoaded / param1.bytesTotal * 100, 100);
        }

        public function SendFile(param1):void
        {
            var _loc_2:*;
            if (v < File.fileList.length)
            {
                _loc_2 = File.fileList[v];
                pro.setProgress((v + 1) / File.fileList.length * 100, 100);
                Text.text = Text.text + ("上传文件: " + _loc_2.name + " 完成.\n");
                Text.verticalScrollPosition = Text.maxVerticalScrollPosition;
                fpro.setProgress(0, 100);
                _loc_2.upload(new URLRequest("test.asp"));
                v++;
                _loc_2.addEventListener(Event.COMPLETE, SendFile);
                _loc_2.addEventListener(ProgressEvent.PROGRESS, showfpro);
            }
            else
            {
                Text.text = Text.text + "已经完成所有文件上传.\n";
                Text.verticalScrollPosition = Text.maxVerticalScrollPosition;
            }// end else if
        }

        function frame1():void
        {
            v = 0;
            Text = new TextArea();
            Text.x = 2;
            Text.y = 2;
            Text.width = 250;
            Text.height = 98;
            Text.editable = false;
            Text.text = "== Flash+ASP文件批量上传组件 v1.0 == \n\n";
            addChild(Text);
            Btn = new Button();
            Btn.label = "浏览";
            Btn.width = 60;
            Btn.x = 265;
            Btn.y = 20;
            Btn.addEventListener("click", Brower);
            addChild(Btn);
            upBtn = new Button();
            upBtn.label = "上传";
            upBtn.width = 60;
            upBtn.x = 335;
            upBtn.y = 20;
            upBtn.enabled = false;
            upBtn.addEventListener("click", upfile);
            addChild(upBtn);
            fpro = new ProgressBar();
            fpro.mode = "manual";
            fpro.setProgress(0, 100);
            fpro.x = 265;
            fpro.y = 60;
            addChild(fpro);
            pro = new ProgressBar();
            pro.mode = "manual";
            pro.setProgress(0, 100);
            pro.x = 265;
            pro.y = 75;
            addChild(pro);
            File = new FileReferenceList();
            File.addEventListener(Event.SELECT, FileSelect);
        }

        public function upfile(param1):void
        {
            Text.text = Text.text + "开始上传文件...\n";
            Text.verticalScrollPosition = Text.maxVerticalScrollPosition;
            upBtn.enabled = false;
            v = 0;
            SendFile(null);
        }

        public function FileSelect(param1):void
        {
            upBtn.enabled = true;
            Text.text = Text.text + ("--- 当前选择文件有 " + File.fileList.length + " 个: ---\n");
           
			pro.setProgress(0, 100);
            Text.verticalScrollPosition = Text.maxVerticalScrollPosition;
			for (var i:int=0; i< File.fileList.length; i++) {
				Text.text = Text.text + (File.fileList[i].name + "\n");
			}
        }
    }
}
