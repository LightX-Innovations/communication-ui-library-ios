public struct TransformTransformsRotateArgs {
  let angle: Double
}

public struct TransformTransformsFlipArgs {
  public enum Axis {
    case horizontal
    case vertical
  }
  let axis: Axis
}

public enum CameraTransformsTypeEnum {
  case rotate
  case flip
}

public struct CameraTransforms<T> {
  var order: Int
  var type: CameraTransformsTypeEnum
  var args: T
}
