public struct TransformTransformsRotateArgs {
  let angle: Double

  public init(angle: Double) {
    self.angle = angle
  }
}

public struct TransformTransformsFlipArgs {
  public enum Axis {
    case horizontal
    case vertical

    public var description: String {
      switch self {
      case .horizontal:
        return "horizontal"
      case .vertical:
        return "vertical"
      }
    }

    public static func == (
      lhs: Axis,
      rhs: Axis
    ) -> Bool {
      switch (lhs, rhs) {
      case (.horizontal, .horizontal),
        (.vertical, .vertical):
        return true
      default:
        return false
      }
    }
  }
  let axis: Axis

  public init(axis: Axis) {
    self.axis = axis
  }

  public static func == (
    lhs: TransformTransformsFlipArgs,
    rhs: TransformTransformsFlipArgs
  ) -> Bool {
    return lhs.axis == rhs.axis
  }
}

public enum CameraTransformsTypeEnum {
  case rotate
  case flip

  public var description: String {
    switch self {
    case .rotate:
      return "rotate"
    case .flip:
      return "flip"
    }
  }

  public static func == (
    lhs: CameraTransformsTypeEnum,
    rhs: CameraTransformsTypeEnum
  ) -> Bool {
    switch (lhs, rhs) {
    case (.rotate, .rotate),
      (.flip, .flip):
      return true
    default:
      return false
    }
  }
}

public struct CameraTransforms<T> {
  var order: Int
  var type: CameraTransformsTypeEnum
  var args: T

  public init(order: Int, type: CameraTransformsTypeEnum, args: T) {
    self.order = order
    self.type = type
    self.args = args
  }
}
