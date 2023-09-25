# macOS Code Signing 가이드

코드 서명 (Code Signing)은 macOS 보안 기술의 핵심 요소로서, 애플리케이션이 변조되거나 변경되지 않았음을 확인합니다. Apple Developer Program에 가입한 개발자는 Apple에서 발급한 개발자 ID 인증서를 사용하여 코드에 서명하며, 사용자는 이 서명을 통해 소프트웨어가 제작 후 변조되지 않았음을 확인할 수 있습니다.

## macOS 10.15 (Catalina)에서의 중요성

macOS 10.15 (Catalina)부터는 App Store 외부에서 다운로드된 모든 애플리케이션은 Apple에서 발급한 개발자 ID 인증서로 서명되어야 하며, 기본 Gatekeeper 설정에서 실행하려면 추가로 Apple의 공증도 필요합니다. 사내 개발 앱도 이러한 방식으로 무결성을 확인할 수 있어야 합니다.

## 코드 서명 (Code Signing) 절차

1. Apple Developer Program 가입: Apple Developer Program에서 가입합니다.
2. 개발자 ID 인증서 생성: 가입 후 Developer ID 인증서를 생성하고, 생성된 인증서를 Keychain Access에 저장합니다.
3. iCloud 로그인: 코드 서명을 수행하는 PC에서 시스템 환경 설정 -> Apple ID 메뉴로 이동하여 iCloud에 로그인합니다.
4. 코드 서명 실행: 서명 대상에 따라 아래의 명령어를 사용합니다. 만약 코드 서명이 정상적으로 수행되지 않는 경우, find [HERE NAME].[EXTENSION] | xargs xattr -xc 명령어를 사용하여 대상의 정보를 삭제한 후 다시 시도합니다.

``` bash
# .dylib 파일의 경우:
codesign --verbose --timestamp -s "[DeveloperID]" ~/[HERE NAME].dylib

# .app 파일의 경우:
codesign --verbose --timestamp -s "[DeveloperID]" --options=runtime ~/[HERE NAME].app

# .framework 파일의 경우:
codesign --verbose --deep --timestamp -s "[DeveloperID]" --options=runtime ~/[HERE NAME].framework
```

이 가이드는 macOS에서 코드 서명을 수행하는 기본 절차를 안내합니다. 고급 설정 또는 특별한 요구 사항이 있는 경우, Apple의 공식 문서나 추가 자료를 참조하시기 바랍니다.

## 레퍼런스
- [https://developer.apple.com/kr/support/code-signing/](https://developer.apple.com/kr/support/code-signing/)
- [https://support.apple.com/ko-kr/guide/security/sec3ad8e6e53/web](https://support.apple.com/ko-kr/guide/security/sec3ad8e6e53/web)
- [https://www.bonobono.net/dev/os/mac-notarizing/](https://www.bonobono.net/dev/os/mac-notarizing/)
- [http://cwyang.github.io/2020/12/09/osx-codesign-notarization.html](http://cwyang.github.io/2020/12/09/osx-codesign-notarization.html)
- [https://dev-dream-world.tistory.com/208](https://dev-dream-world.tistory.com/208)