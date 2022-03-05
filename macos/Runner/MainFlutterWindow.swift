import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController.init()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)
    
    self.styleMask = [.closable, .titled, .miniaturizable]
    let windowWidth = 650
    let windowHeight = 700
    self.contentMaxSize = NSSize(width: windowWidth, height: windowHeight)
    self.contentMinSize = NSSize(width: windowWidth, height: windowHeight)
    self.setContentSize(NSSize(width: windowWidth, height: windowHeight))
      
    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
