import QuartzCore

public struct ClickAction: DraggingAction {
    public let control: A11yControl
    
    public func drag(to coordinate: CGPoint) {
        
    }
    
    public func end(at coodrinate: CGPoint) -> DraggingAction? {
        return self
    }
}
