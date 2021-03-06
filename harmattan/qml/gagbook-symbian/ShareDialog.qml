/*
 * Copyright (c) 2014 Dickson Leong.
 * All rights reserved.
 *
 * This file is part of GagBook.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import QtQuick 1.1
import com.nokia.symbian 1.1

ContextMenu {
    id: shareDialog

    property string link

    platformInverted: appSettings.whiteTheme

    MenuLayout {
        MenuItem {
            text: "Share via Facebook"
            platformInverted: shareDialog.platformInverted
            onClicked: {
                QMLUtils.openDefaultBrowser("http://www.facebook.com/sharer.php?u=" + link)
                infoBanner.alert("Launching web browser...")
            }
        }
        MenuItem {
            text: "Share via Twitter"
            platformInverted: shareDialog.platformInverted
            onClicked: {
                QMLUtils.openDefaultBrowser("https://twitter.com/intent/tweet?url=" + link);
                infoBanner.alert("Launching web browser...");
            }
        }
        MenuItem {
            text: "Share via SMS"
            platformInverted: shareDialog.platformInverted
            onClicked: {
                Qt.openUrlExternally("sms:?body=" + link)
                infoBanner.alert("Launching SMS...")
            }
        }
        MenuItem {
            text: "Share via email"
            platformInverted: shareDialog.platformInverted
            onClicked: {
                Qt.openUrlExternally("mailto:?body=" + link)
                infoBanner.alert("Launching email client...")
            }
        }
    }
}
