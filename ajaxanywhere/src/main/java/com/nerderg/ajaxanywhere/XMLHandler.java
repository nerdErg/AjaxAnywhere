/*
   Copyright 2005  Vitaliy Shevchuk (shevit@users.sourceforge.net)
   Copyright 2013  nerdErg Pty Ltd (sales@nerderg.com)

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

package com.nerderg.ajaxanywhere;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.ByteArrayOutputStream;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Iterator;
import java.util.Set;

/**
 * Class to perform all XML operation
 * @author Angel Ruiz (aruizca@gmail.com)
 */
public class XMLHandler {

    /**
     * Generates the XML response with zones to refresh and sends it
     * @param bufferResponseWrapper
     * @param refreshZones
     */
    public static void sendZones(BufferResponseWrapper bufferResponseWrapper, Set refreshZones) {
        Document doc = newDocument();
        Element root = addRootElement(doc, AAConstants.AA_XML_ZONES);

        for (Iterator iterator = refreshZones.iterator(); iterator.hasNext();) {
            String zone = (String) iterator.next();
            String content = AAUtils.getZoneContent(zone, bufferResponseWrapper);

            //if zone added to refresh list but not present in content, then exclude zone info in response
            if(content == null) {
                continue;
            }

            Element zoneNode = doc.createElement(AAConstants.AA_XML_ZONE);
            zoneNode.setAttribute(AAConstants.AA_XML_ID, zone);

            handleZoneContent(content, zoneNode, doc, root);
        }

        sendDOMDocument(bufferResponseWrapper.getOriginalResponse(), doc);
    }

    /**
     *
     * @param content
     * @param zoneNode
     * @param doc
     * @param root
     */
    private static void handleZoneContent(String content, Element zoneNode, Document doc, Element root) {
        appendText(zoneNode, doc, content);
        root.appendChild(zoneNode);
    }

    /**
     * Adds root element to XML
     * @param doc
     * @param rootTagName
     * @return
     */
    private static Element addRootElement(Document doc, String rootTagName) {
        Element root = doc.createElement(rootTagName);
        doc.appendChild(root);
        return root;
    }

    /**
     * Attaches the XML to response
     * @param originalResponse
     * @param doc
     */
    private static void sendDOMDocument(HttpServletResponse originalResponse, Document doc) {
        try {

            Transformer transformer = TransformerFactory.newInstance().newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            transformer.transform(new DOMSource(doc), new StreamResult(baos));
            // Important!!! This is required because due to encoding stuff, the response header might say that its size is bigger than it actually is, causing all sort of problems because the browser keeps waiting for the rest.
            originalResponse.setContentLength(baos.size());
            baos.writeTo(originalResponse.getOutputStream());
            originalResponse.flushBuffer();

        } catch (TransformerException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Returns a new XML Document
     * @return
     */
    private static Document newDocument() {
        try {
            return DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
        } catch (ParserConfigurationException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Add text to XML node
     * @param zoneNode
     * @param doc
     * @param content
     */
    private static void appendText(Element zoneNode, Document doc, String content) {
        zoneNode.appendChild(doc.createCDATASection(content.replaceAll("\r", "")));
    }

    /**
     * Sends error trace inside the XML
     * @param response
     * @param exception
     */
    public static void handleError(HttpServletResponse response, Throwable exception) {
        Document doc = newDocument();

        Element root = addRootElement(doc, AAConstants.AA_XML_EXCEPTION);
        root.setAttribute(AAConstants.AA_XML_TYPE, exception.getClass().getName());
        StringWriter sw = new StringWriter();
        exception.printStackTrace(new PrintWriter(sw));
        appendText(root, doc, sw.toString());

        sendDOMDocument(response, doc);
    }

    /**
     * Send redirect URL inside XML node
     * @param bufferResponseWrapper
     */
    public static void sendRedirect(BufferResponseWrapper bufferResponseWrapper) {
        Document doc = newDocument();
        Element root = addRootElement(doc, AAConstants.AA_XML_REDIRECT);
        appendText(root, doc, bufferResponseWrapper.getRedirect());

        sendDOMDocument(bufferResponseWrapper.getOriginalResponse(), doc);
    }
}
