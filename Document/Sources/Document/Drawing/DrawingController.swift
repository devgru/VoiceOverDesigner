import CoreGraphics
import QuartzCore

public class DrawingController {
    public init(view: DrawingView) {
        self.view = view
        
#if os(macOS)
        view.wantsLayer = true
#endif
    }
    
    public let view: DrawingView
    private var action: DraggingAction?
    
    // MARK: Drawn from existed controls
    
    @discardableResult
    public func drawControl(from description: A11yDescription) -> A11yControl {
        let control = A11yControl()
        control.a11yDescription = description
        control.frame = description.frame
        control.backgroundColor = description.color.cgColor
        
        view.add(control: control)
        return control
    }
    
    // MARK: New drawing
    public func mouseDown(on location: CGPoint) {
        if let existedControl = view.control(at: location) {
            startTranslating(control: existedControl,
                             startLocation: location)
        } else {
            startDrawing(coordinate: location)
        }
    }
    
    private func startTranslating(control: A11yControl, startLocation: CGPoint) {
        self.action = TranslateAction(view: view, control: control, startLocation: startLocation,
                                      offset: .zero, initialFrame: control.frame)
    }
    
    private func startDrawing(coordinate: CGPoint) {
        let control = drawControl(from: .empty(frame: .zero))
        
        self.action = NewControlAction(view: view, control: control, coordinate: coordinate)
    }
    
    public func drag(to coordinate: CGPoint) {
        action?.drag(to: coordinate)
    }
    
    public func end(coordinate: CGPoint) -> DraggingAction? {
        defer {
            self.action = nil
            view.alingmentOverlay.hideAligningLine()
        }
        
        drag(to: coordinate)
        
        return action?.end(at: coordinate)
    }
}
