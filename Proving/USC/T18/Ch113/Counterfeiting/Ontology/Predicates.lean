











import Proving.USC.T18.Ch113.Counterfeiting.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch113.Counterfeiting.Ontology

open Proving.USC.Common






axiom IsCounterfeitLabel (l : Label) (c : ComplaintText) : Prop






axiom IsIllicitLabel (l : Label) (c : ComplaintText) : Prop




axiom IsDocumentationOrPackaging (d : Packaging) (c : ComplaintText) : Prop




axiom IsCounterfeitDocumentationOrPackaging (d : Packaging) (c : ComplaintText) : Prop





axiom IsCounterfeitMark (m : Mark) (c : ComplaintText) : Prop






axiom IsCounterfeitMilitaryGoodOrService (g : Good) (c : ComplaintText) : Prop





axiom IsDrug (g : Good) (c : ComplaintText) : Prop






axiom IsTraffic (t : TraffickingAct) (c : ComplaintText) : Prop




axiom IsFinancialGain (v : Value) (c : ComplaintText) : Prop





axiom LabelAppearsGenuineButIsNot (l : Label) (c : ComplaintText) : Prop



axiom PackagingAppearsGenuineButIsNot (d : Packaging) (c : ComplaintText) : Prop




axiom UsedByCopyrightOwnerToVerify (l : Label) (c : ComplaintText) : Prop





axiom WithoutCopyrightOwnerAuthorization (l : Label) (c : ComplaintText) : Prop






axiom IsSpuriousMarkAllConditions (m : Mark) (c : ComplaintText) : Prop





axiom IsSpuriousLanhamDesignation (m : Mark) (c : ComplaintText) : Prop




axiom GoodBearsCounterfeitMark (g : Good) (c : ComplaintText) : Prop





axiom GoodMeetsMilitaryNexus (g : Good) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113.Counterfeiting.Ontology
