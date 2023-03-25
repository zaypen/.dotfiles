function __fish_flutter_enable_mirror
    set -gx PUB_HOSTED_URL https://pub.flutter-io.cn
    set -gx FLUTTER_STORAGE_BASE_URL https://storage.flutter-io.cn
    set -gx FLUTTER_GIT_URL https://mirrors.tuna.tsinghua.edu.cn/git/flutter-sdk.git
end

function __fish_flutter_disable_mirror
    set -ge PUB_HOSTED_URL FLUTTER_STORAGE_BASE_URL FLUTTER_GIT_URL
end
