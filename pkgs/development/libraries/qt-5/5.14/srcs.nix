# DO NOT EDIT! This file is generated automatically.
# Command: ./maintainers/scripts/fetch-kde-qt.sh pkgs/development/libraries/qt-5/5.14
{ fetchurl, mirror }:

{
  qt3d = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qt3d-everywhere-src-5.14.1.tar.xz";
      sha256 = "86f425e8bdf55b7b3f6a8384c2b9cffee30407fcf87ece0db060fdfb797a0774";
      name = "qt3d-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtactiveqt = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtactiveqt-everywhere-src-5.14.1.tar.xz";
      sha256 = "457dba433497d79a0ee0e44f9f8cf8afbcbb2e36861f98516413a688a5e88aa0";
      name = "qtactiveqt-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtandroidextras = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtandroidextras-everywhere-src-5.14.1.tar.xz";
      sha256 = "7986b087532ec6011c8dfa03977cf945f42ec245e84e941acebbe9068f1ca3c6";
      name = "qtandroidextras-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtbase = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtbase-everywhere-src-5.14.1.tar.xz";
      sha256 = "d9d423a6e7bcf1055c0372fc029f14a6fe67dd62c67b83095cde68b60b762cf7";
      name = "qtbase-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtcharts = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtcharts-everywhere-src-5.14.1.tar.xz";
      sha256 = "3dd7466c06130ec3a7842189a203a72576e7ed5424950903410fa1a4f70d9c2b";
      name = "qtcharts-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtconnectivity = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtconnectivity-everywhere-src-5.14.1.tar.xz";
      sha256 = "ef0cb1883c0e765cacf6c8b9422997b93fd861cf2289e56791615401eefa2d72";
      name = "qtconnectivity-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtdatavis3d = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtdatavis3d-everywhere-src-5.14.1.tar.xz";
      sha256 = "cfb94803a88c7405abf78ac445c4603b614889504fbf5279c9c192451a378f96";
      name = "qtdatavis3d-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtdeclarative = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtdeclarative-everywhere-src-5.14.1.tar.xz";
      sha256 = "762fe495d2f97fd70f06dc7d3929506ea3b5e3151ad813e0629209b7bc504c8a";
      name = "qtdeclarative-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtdoc = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtdoc-everywhere-src-5.14.1.tar.xz";
      sha256 = "17c66b4c0bbee3d7d7ed8e93453d2b994b2a16921b0789dc198fdb8085988c4b";
      name = "qtdoc-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtgamepad = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtgamepad-everywhere-src-5.14.1.tar.xz";
      sha256 = "13277d7362ebe912b55e233674bc862e4b5342705c9207bd16c83f107d0e3499";
      name = "qtgamepad-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtgraphicaleffects = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtgraphicaleffects-everywhere-src-5.14.1.tar.xz";
      sha256 = "aabb87d9f982a8cb213de06b954cef29551f2d9ce10afa0ff9e5571203b56138";
      name = "qtgraphicaleffects-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtimageformats = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtimageformats-everywhere-src-5.14.1.tar.xz";
      sha256 = "b8b177ea68df3a99f45740cb3193e3b38738c5e2b272028445bd31a4305c8e5e";
      name = "qtimageformats-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtlocation = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtlocation-everywhere-src-5.14.1.tar.xz";
      sha256 = "a0dd1712a5b7a0425b57d17318294b6f7e968c4b81d52048696d029b04d2f12f";
      name = "qtlocation-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtlottie = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtlottie-everywhere-src-5.14.1.tar.xz";
      sha256 = "098fbb8d8ce1288f940a3203f1353b4da522623d59fe5bed61abd3df41e5b2aa";
      name = "qtlottie-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtmacextras = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtmacextras-everywhere-src-5.14.1.tar.xz";
      sha256 = "8c263fdba519d7e04bc64767883283eedede0752aa47cc440670129725696e29";
      name = "qtmacextras-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtmultimedia = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtmultimedia-everywhere-src-5.14.1.tar.xz";
      sha256 = "c458121c8db7ff77eefe643a7c9847ff324647f2603bb5664bcafa6435edeae7";
      name = "qtmultimedia-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtnetworkauth = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtnetworkauth-everywhere-src-5.14.1.tar.xz";
      sha256 = "e7f9705d014056a0d8a9751e7ad4b472f1184b8ef822124f0363753730536ae0";
      name = "qtnetworkauth-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtpurchasing = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtpurchasing-everywhere-src-5.14.1.tar.xz";
      sha256 = "bcb0a7f62be4a116feee4af759b89a55084c0364327a83ab0b73acdc60eab8a9";
      name = "qtpurchasing-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtquick3d = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtquick3d-everywhere-src-5.14.1.tar.xz";
      sha256 = "073a88e440c355c408500306c3a6aa166be60c67e5ce26a9cb6ff7aac0bd43dc";
      name = "qtquick3d-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtquickcontrols = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtquickcontrols-everywhere-src-5.14.1.tar.xz";
      sha256 = "54519e7c6748bb9af46435a7ba2ce1c53e4ad164a70e88915fe0e61277540a1a";
      name = "qtquickcontrols-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtquickcontrols2 = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtquickcontrols2-everywhere-src-5.14.1.tar.xz";
      sha256 = "52d652c48933cc8416a91138eb6fb4c31625734265671f286b6c0d3e27d120ae";
      name = "qtquickcontrols2-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtquicktimeline = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtquicktimeline-everywhere-src-5.14.1.tar.xz";
      sha256 = "2b2e0e74aaf277a585ea40bcbc3e530090420d71e420f6d1e9c6a134cd0836c8";
      name = "qtquicktimeline-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtremoteobjects = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtremoteobjects-everywhere-src-5.14.1.tar.xz";
      sha256 = "189c8bddaebde0420742af0d85b7e7bf00c558f030bc0a7b704ce86072706e75";
      name = "qtremoteobjects-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtscript = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtscript-everywhere-src-5.14.1.tar.xz";
      sha256 = "d8071e665935f7f6733f5ef700054a0cbbf8b569e7900439b89d3301f70adadd";
      name = "qtscript-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtscxml = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtscxml-everywhere-src-5.14.1.tar.xz";
      sha256 = "6dbcf012cc11931050c8d9422cbf478ee173dfb0c5b8aebf0f829b6f74d741aa";
      name = "qtscxml-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtsensors = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtsensors-everywhere-src-5.14.1.tar.xz";
      sha256 = "eda3862cf079ac2357553be4faaae0136aa017e954506ca0c4239995b5be214c";
      name = "qtsensors-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtserialbus = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtserialbus-everywhere-src-5.14.1.tar.xz";
      sha256 = "a49f72ef59e2ad82155269bd54322bf2638d2793b5adc0cd44ae99bab88f1045";
      name = "qtserialbus-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtserialport = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtserialport-everywhere-src-5.14.1.tar.xz";
      sha256 = "ac7e51e99294998fae8bb3e2feebbd1820ecd774eb9ad8e7ea507f5bd06dcd6f";
      name = "qtserialport-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtspeech = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtspeech-everywhere-src-5.14.1.tar.xz";
      sha256 = "abd9a1863a64de0a148ae37e5fdecde7fd486348f7b26c054008f8506223e425";
      name = "qtspeech-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtsvg = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtsvg-everywhere-src-5.14.1.tar.xz";
      sha256 = "8540a57312f815f81a45b891b49959d776727fde17579bb6bf1a537996bc9359";
      name = "qtsvg-everywhere-src-5.14.1.tar.xz";
    };
  };
  qttools = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qttools-everywhere-src-5.14.1.tar.xz";
      sha256 = "7f5e6370cf4ed59f2bdd6517870cdcb1df9a055bbd885d056d90938ab302c70c";
      name = "qttools-everywhere-src-5.14.1.tar.xz";
    };
  };
  qttranslations = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qttranslations-everywhere-src-5.14.1.tar.xz";
      sha256 = "a7598068802f4ddda99865ea9c3503015d02ed1e1ff5875e936b42ab8eb2de46";
      name = "qttranslations-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtvirtualkeyboard = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtvirtualkeyboard-everywhere-src-5.14.1.tar.xz";
      sha256 = "277baaf6043328d06585c7a9046461308aa7602b21f531bcda12e6df5bce5295";
      name = "qtvirtualkeyboard-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtwayland = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtwayland-everywhere-src-5.14.1.tar.xz";
      sha256 = "2a03b9f554e88c5824ef237c814b3dd45844c022e97be0e091f4a502ca4c9520";
      name = "qtwayland-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtwebchannel = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtwebchannel-everywhere-src-5.14.1.tar.xz";
      sha256 = "3af5262fde14c7dfe7bcc12d5796a482837bd09f0878851fd8de5db0b1985e6a";
      name = "qtwebchannel-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtwebengine = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtwebengine-everywhere-src-5.14.1.tar.xz";
      sha256 = "4ec77040a876a83aa2a833ebfe7b3e88dcc167ceb317095eb226a0b8d455e887";
      name = "qtwebengine-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtwebglplugin = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtwebglplugin-everywhere-src-5.14.1.tar.xz";
      sha256 = "de7768ab6a8de06e09467b6dc8714fa71ed5781e2654aa3498a7105328f565a6";
      name = "qtwebglplugin-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtwebsockets = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtwebsockets-everywhere-src-5.14.1.tar.xz";
      sha256 = "742fb3d39043728ca4fc1533e9a1e3b701bc5bf4e27cba316077e9f0df0b3fef";
      name = "qtwebsockets-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtwebview = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtwebview-everywhere-src-5.14.1.tar.xz";
      sha256 = "8c18e7686d1480eb255b68e57a196f3ebc37cc4e2fbcd698ec3bed903517adff";
      name = "qtwebview-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtwinextras = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtwinextras-everywhere-src-5.14.1.tar.xz";
      sha256 = "222b888b89a8fb02948faf985e8614ac543603a000c1cf2e7489f8bf15ccc3cc";
      name = "qtwinextras-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtx11extras = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtx11extras-everywhere-src-5.14.1.tar.xz";
      sha256 = "b268907deb06570671c1f584feb1508e7fded129209a268183decc122bfac181";
      name = "qtx11extras-everywhere-src-5.14.1.tar.xz";
    };
  };
  qtxmlpatterns = {
    version = "5.14.1";
    src = fetchurl {
      url = "${mirror}/official_releases/qt/5.14/5.14.1/submodules/qtxmlpatterns-everywhere-src-5.14.1.tar.xz";
      sha256 = "fb993a112e591c84ea159a752a4026031a212a7af6f31a1b288552c924c18224";
      name = "qtxmlpatterns-everywhere-src-5.14.1.tar.xz";
    };
  };
}
