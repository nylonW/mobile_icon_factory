import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController.init()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)
    
      self.styleMask = [.closable, .titled, .miniaturizable]
      self.contentMaxSize = NSSize(width: 650, height: 650)
      self.contentMinSize = NSSize(width: 650, height: 650)
      self.setContentSize(NSSize(width: 650, height: 650))
      
    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
