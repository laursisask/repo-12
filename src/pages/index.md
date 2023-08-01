
import './styles/main.css'
import bgImg from './images/Summary-background.svg'
import SpaceContent from './adobe-express/spaceAbility.md'
import LearnMore from "./adobe-express/learnmore.md"

<Hero slots="heading, text, buttons, assetsImg" customLayout variant="halfwidth" className="add-ones-hero adobe-express-hero"/>

## Unlock creativity anywhere.

[Adobe Express](https://adobe.com/express) is an all-in-one design, photo, and video tool to make content creation easy. Build add-ons for Adobe Express or embed Adobe Express features into your application. Learn more about:

- [Add-ons](https://developer.adobe.com/express/add-ons)
- [Embed SDK](https://developer.adobe.com/express/embed-sdk)

homeExpressLandingPage

<TextBlock slots="heading,text,image,buttons" theme="lightest" headerElementType="h2" variantsTypePrimary='secondary' variantStyleFill = "outline" homeZigZag className="explore unleash-power" position="left" />

### Extend the power of Adobe Express with add-ons.

Add-ons are applications that helps users add content to their pages, share their designs, and unlock their creative potential in new ways.

![Power of Adobe Express](./images/AddOn.png)

- [Learn more](https://developer.adobe.com/express/add-ons)
- [View documentation](https://developer.adobe.com/express/add-ons/docs/guides/)

<TextBlock slots="heading" className="announcement exploreCapabilities inspiration" theme="lightest"/>

### Get inspiration from the add-on marketplace.

<SpaceContent />

<DCSummaryBlock slots="text, buttons" theme="dark"  buttonPositionRight btnVariant="cta" className="tryForFree" />

Check out all the add-ons available in Adobe Express.

- [Explore more](https://new.express.adobe.com/new?category=addOns)
  
<TextBlock slots="heading,text,image,buttons" theme="light" headerElementType="h2" variantsTypePrimary='secondary' variantStyleFill = "outline" homeZigZag className="explore unleash-power" position="right" />

### Bring Adobe Express functionality to your website with the Embed SDK.

Give your users of all skills levels the power to edit and create with access to thousands of templates, fonts, stock images, and videos.

![Adobe Express functionality](./images/Embed.png)

- [Try the demo](https://demo.expressembed.com)
- [View documentation](https://developer.adobe.com/express/embed-sdk/docs/guides)
  
<TextBlock slots="heading,text" className="announcement exploreCapabilities walkthetalk" theme="light"/>

### We walk the talk.

Catch Adobe Express in other Adobe products.

<ImageTextBlock slots="image,heading,text" repeat="2" theme="light" bgColor="#f8f8f8" className="boxmodal" isCenter variantsTypePrimary='secondary'/>

![Customize within Adobe Acrobat](./images/AcrobatEmbed.png)

## Customize within Adobe Acrobat.

The embedded full editor allows users to create eye-catching cover and divider pages easily and quickly within Acrobat.

![Creative Cloud desktop](./images/CCEmbed.png)

## Edit within Adobe Creative Cloud desktop.

Launch Adobe Express image and video quick actions within Creative Cloud on desktop.

<WrapperComponent slots="content" repeat="1" theme="light" />

<LearnMore />

<TextBlock slots="heading" className="announcement exploreCapabilities support-label" theme="lightest"/>

### Support and resources are here for you.

<MiniResourceCard slots="image,heading,link" repeat="3" theme="lightest" inRow="3" className="mini-card support-tools" />

![Blog](./images/Blog.svg)

### Blog

[Link to blog post](https://blog.developer.adobe.com/adobe-express-introduces-add-ons-for-developers-24ca166a5614)

![Add-on Community](./images/Add-ons-community.svg)

### Add-on community (coming soon)

[Link to add-ons community]()

![Embed SDK forum](./images/Embed-forums.png)

### Embed SDK forum

[link to embed forum](https://community.adobe.com/t5/adobe-express-embed-sdk/ct-p/ct-express-embed-sdk?page=1&sort=latest_replies&lang=all&tabid=all)

<TeaserBlock  slots="heading,text,buttons" textColor="white" bgURL={bgImg} className="viewAddOn creative-express" variant="fullwidth"/>

### Dive right in.

Explore which Adobe Express add-ons to build into your platform or learn more about the Adobe Express Embed SDK.

- [Add-ons](https://developer.adobe.com/express/add-ons)
- [Embed SDK](https://developer.adobe.com/express/embed-sdk)
