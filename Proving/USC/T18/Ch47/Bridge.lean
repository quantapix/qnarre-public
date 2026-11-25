


































































import Proving.USC.T18.Ch47.Elements.Statute
import Proving.USC.T18.Ch47.Deontic.Statute
import Proving.USC.T18.Ch47.Ontology.Statute
import Proving.USC.T18.Ch47.Procedure.Statute
import Proving.USC.T18.Ch47.Structure.Statute
import Proving.Rico.Statute
import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch47.Bridge

open Proving.USC.Common











axiom mapItemED : Elements.Item → Deontic.IdentificationArtifact

axiom mapDeviceED : Elements.Device → Deontic.AccessArtifact


axiom mapDevicesED : List Elements.Device → Deontic.AccessArtifact


axiom artifactOfPerson1029 : Person → ComplaintText → Deontic.AccessArtifact


axiom mapItemODoc : Elements.Item → Ontology.Document

axiom mapItemOFeat : Elements.Item → Ontology.Feature

axiom mapItemOId : Elements.Item → Ontology.Identifier

axiom mapDeviceOD : Elements.Device → Ontology.Device




axiom actOf1028 : Person → ComplaintText → Ontology.Act


axiom actOf1029 : Person → ComplaintText → Ontology.Act








namespace S1028






axiom corr_addressee1028 (p : Person) (c : ComplaintText) :
    Deontic.AddresseeWhoever1028a p c


axiom corr_c1_gov {i : Elements.Item} {c : ComplaintText} :
    Elements.DocumentIssuedOrAppearsIssuedUnderUnitedStatesAuthority i c →
    Deontic.CircumstanceUnitedStatesDocument1028c1 (mapItemED i) c


axiom corr_c1_impl {i : Elements.Item} {c : ComplaintText} :
    Elements.ImplementSuitedForUnitedStatesDocument i c →
    Deontic.CircumstanceUnitedStatesDocument1028c1 (mapItemED i) c


axiom corr_c2 {p : Person} {i : Elements.Item} {c : ComplaintText} :
    Elements.Section1028a4 p i c →
    Deontic.CircumstanceIsSubsectionA4Offense1028c2 p c

axiom corr_c3_commerce (i : Elements.Item) {p : Person} {c : ComplaintText} :
    Elements.EngagedInInterstateOrForeignCommerce p c →
    Deontic.CircumstanceInterstateCommerceOrMail1028c3 p (mapItemED i) c

axiom corr_c3_mail {p : Person} {i : Elements.Item} {c : ComplaintText} :
    Elements.ItemTransportedInTheMail i c →
    Deontic.CircumstanceInterstateCommerceOrMail1028c3 p (mapItemED i) c




theorem circ1028_ED {p : Person} {i : Elements.Item} {c : ComplaintText}
    (h : Elements.Circumstance1028c p i c) : Deontic.Circumstance1028c p c :=
  match h with
  | .governmentalDocument hx => .unitedStatesDocument (mapItemED i) (corr_c1_gov hx)
  | .implementSuited hx => .unitedStatesDocument (mapItemED i) (corr_c1_impl hx)
  | .offenseUnderA4 hx => .subsectionA4Offense (corr_c2 hx)
  | .commerce hx => .interstateCommerceOrMail (mapItemED i) (corr_c3_commerce i hx)
  | .mail hx => .interstateCommerceOrMail (mapItemED i) (corr_c3_mail hx)

axiom corr_a1 {p : Person} {i : Elements.Item} {c : ComplaintText} :
    Elements.Section1028a1 p i c →
    Deontic.ProducesWithoutLawfulAuthority1028a1 p (mapItemED i) c
axiom corr_a2 {p : Person} {i : Elements.Item} {c : ComplaintText} :
    Elements.Section1028a2 p i c →
    Deontic.TransfersKnowingStolenOrUnauthorized1028a2 p (mapItemED i) c
axiom corr_a3 {p : Person} {items : List Elements.Item} {c : ComplaintText} :
    Elements.Section1028a3 p items c →
    Deontic.PossessesFiveOrMoreWithUnlawfulIntent1028a3 p c
axiom corr_a4 {p : Person} {i : Elements.Item} {c : ComplaintText} :
    Elements.Section1028a4 p i c →
    Deontic.PossessesWithIntentToDefraudUnitedStates1028a4 p (mapItemED i) c
axiom corr_a5 {p : Person} {i : Elements.Item} {c : ComplaintText} :
    Elements.Section1028a5 p i c →
    Deontic.ProducesTransfersOrPossessesImplement1028a5 p (mapItemED i) c
axiom corr_a6 {p : Person} {i : Elements.Item} {c : ComplaintText} :
    Elements.Section1028a6 p i c →
    Deontic.PossessesStolenUnitedStatesDocument1028a6 p (mapItemED i) c
axiom corr_a7 {p : Person} {i : Elements.Item} {c : ComplaintText} :
    Elements.Section1028a7 p i c →
    Deontic.UsesMeansOfIdentificationForUnlawfulActivity1028a7 p (mapItemED i) c
axiom corr_a8 {p : Person} {i : Elements.Item} {c : ComplaintText} :
    Elements.Section1028a8 p i c →
    Deontic.TrafficsInAuthenticationFeatures1028a8 p (mapItemED i) c




theorem act1028_ED {p : Person} {i : Elements.Item} {items : List Elements.Item}
    {c : ComplaintText} (h : Elements.ProhibitedConduct1028a p i items c) :
    Deontic.ProhibitedAct1028a p c :=
  match h with
  | .produce hx => .producesWithoutAuthority (mapItemED i) (corr_a1 hx)
  | .transferStolen hx => .transfersKnowingStolen (mapItemED i) (corr_a2 hx)
  | .possessFiveOrMore hx => .possessesFiveOrMore (corr_a3 hx)
  | .possessToDefraudUnitedStates hx =>
      .possessesToDefraudUnitedStates (mapItemED i) (corr_a4 hx)
  | .implement hx => .implementWithProductionIntent (mapItemED i) (corr_a5 hx)
  | .possessGovernmental hx =>
      .possessesStolenUnitedStatesDocument (mapItemED i) (corr_a6 hx)
  | .meansOfIdentification hx => .usesMeansOfIdentification (mapItemED i) (corr_a7 hx)
  | .traffickAuthenticationFeature hx =>
      .trafficsInAuthenticationFeatures (mapItemED i) (corr_a8 hx)


axiom corr_exempt1028_DE {p : Person} {c : ComplaintText} :
    Deontic.LawfullyAuthorizedActivityExempt1028e p c →
    Elements.LawfullyAuthorizedInvestigativeOrIntelligenceActivity p c




theorem s1028_elements_implies_deontic {p : Person} {i : Elements.Item}
    {items : List Elements.Item} {c : ComplaintText}
    (h : Elements.ViolationOfSection1028 p i items c) :
    Deontic.ProhibitionViolated1028a p c :=
  ⟨⟨corr_addressee1028 p c, circ1028_ED h.circumstance⟩,
   act1028_ED h.conduct,
   fun hx => h.notExcluded (corr_exempt1028_DE hx)⟩





axiom corr_act1028_DO {p : Person} {c : ComplaintText} :
    Deontic.ProhibitedAct1028a p c →
    Ontology.ProduceS1028Membership (actOf1028 p c) c ∨
      Ontology.TransferS1028Membership (actOf1028 p c) c ∨
      Ontology.TrafficS1028Membership (actOf1028 p c) c


axiom corr_exempt1028_OD {p : Person} {c : ComplaintText} :
    Ontology.IsLawfullyAuthorizedInvestigativeActivity (actOf1028 p c) c →
    Deontic.LawfullyAuthorizedActivityExempt1028e p c






theorem s1028_deontic_implies_ontology {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated1028a p c) :
    Ontology.NonExemptCoveredAct (actOf1028 p c) c :=
  ⟨corr_act1028_DO h.2.1, fun hx => h.2.2 (corr_exempt1028_OD hx)⟩








axiom corr_conduct1028_EO {p : Person} {i : Elements.Item}
    {items : List Elements.Item} {c : ComplaintText} :
    Elements.ProhibitedConduct1028a p i items c →
    Ontology.ProduceS1028Membership (actOf1028 p c) c ∨
      Ontology.TransferS1028Membership (actOf1028 p c) c ∨
      Ontology.TrafficS1028Membership (actOf1028 p c) c
axiom corr_exempt1028_OE {p : Person} {c : ComplaintText} :
    Ontology.IsLawfullyAuthorizedInvestigativeActivity (actOf1028 p c) c →
    Elements.LawfullyAuthorizedInvestigativeOrIntelligenceActivity p c


theorem s1028_elements_implies_ontology {p : Person} {i : Elements.Item}
    {items : List Elements.Item} {c : ComplaintText}
    (h : Elements.ViolationOfSection1028 p i items c) :
    Ontology.NonExemptCoveredAct (actOf1028 p c) c :=
  ⟨corr_conduct1028_EO h.conduct, fun hx => h.notExcluded (corr_exempt1028_OE hx)⟩


axiom corr_idDoc_membership {i : Elements.Item} {c : ComplaintText} :
    Elements.IsIdentificationDocument i c →
    Ontology.IsIdentificationDocument (mapItemODoc i) c
axiom corr_idDoc_issued {i : Elements.Item} {c : ComplaintText} :
    Elements.IsIdentificationDocument i c →
    Ontology.IsIssuedUnderCoveredGovernmentalAuthority (mapItemODoc i) c
axiom corr_idDoc_type {i : Elements.Item} {c : ComplaintText} :
    Elements.IsIdentificationDocument i c →
    Ontology.IsOfTypeCommonlyAcceptedForIdentification (mapItemODoc i) c


axiom corr_authFeat_membership {i : Elements.Item} {c : ComplaintText} :
    Elements.IsAuthenticationFeature i c →
    Ontology.IsAuthenticationFeature (mapItemOFeat i) c
axiom corr_authFeat_kind {i : Elements.Item} {c : ComplaintText} :
    Elements.IsAuthenticationFeature i c →
    Ontology.IsAuthenticationFeatureKind (mapItemOFeat i) c
axiom corr_authFeat_issuer {i : Elements.Item} {c : ComplaintText} :
    Elements.IsAuthenticationFeature i c →
    Ontology.UsedByIssuingAuthorityOnCoveredCarrier (mapItemOFeat i) c
axiom corr_authFeat_falsity {i : Elements.Item} {c : ComplaintText} :
    Elements.IsAuthenticationFeature i c →
    Ontology.ServesFalsityDetectionPurpose (mapItemOFeat i) c




axiom corr_falseIdDoc_membership {i : Elements.Item} {c : ComplaintText} :
    Elements.IsFalseIdentificationDocument i c →
    Ontology.IsFalseIdentificationDocument (mapItemODoc i) c
axiom corr_falseIdDoc_type {i : Elements.Item} {c : ComplaintText} :
    Elements.IsFalseIdentificationDocument i c →
    Ontology.IsOfTypeCommonlyAcceptedForIdentification (mapItemODoc i) c
axiom corr_falseIdDoc_notIssued {i : Elements.Item} {c : ComplaintText} :
    Elements.IsFalseIdentificationDocument i c →
    ¬ Ontology.IsIssuedUnderGovernmentalAuthority (mapItemODoc i) c
axiom corr_falseIdDoc_appears {i : Elements.Item} {c : ComplaintText} :
    Elements.IsFalseIdentificationDocument i c →
    Ontology.AppearsIssuedUnderCoveredGovernmentalAuthority (mapItemODoc i) c




theorem s1028d_objects_elements_implies_ontology {i : Elements.Item}
    {c : ComplaintText} (h : Elements.DocumentOrFeature1028 i c) :
    Ontology.IdentificationDocumentMembership (mapItemODoc i) c ∨
      Ontology.AuthenticationFeatureMembership (mapItemOFeat i) c ∨
      Ontology.FalseIdentificationDocumentMembership (mapItemODoc i) c :=
  match h with
  | .identificationDocument hx =>
      Or.inl ⟨corr_idDoc_membership hx, corr_idDoc_issued hx, corr_idDoc_type hx⟩
  | .authenticationFeature hx =>
      Or.inr (Or.inl ⟨corr_authFeat_membership hx, corr_authFeat_kind hx,
        corr_authFeat_issuer hx, corr_authFeat_falsity hx⟩)
  | .falseIdentificationDocument hx =>
      Or.inr (Or.inr ⟨corr_falseIdDoc_membership hx, corr_falseIdDoc_type hx,
        .notGovernmentIssued (corr_falseIdDoc_notIssued hx),
        corr_falseIdDoc_appears hx⟩)


axiom corr_moi_membership {i : Elements.Item} {c : ComplaintText} :
    Elements.IsMeansOfIdentification i c →
    Ontology.IsMeansOfIdentification (mapItemOId i) c
axiom corr_moi_nameOrNumber {i : Elements.Item} {c : ComplaintText} :
    Elements.IsMeansOfIdentification i c → Ontology.IsNameOrNumber (mapItemOId i) c
axiom corr_moi_identifies {i : Elements.Item} {c : ComplaintText} :
    Elements.IsMeansOfIdentification i c →
    Ontology.MayBeUsedToIdentifySpecificIndividual (mapItemOId i) c





theorem s1028d7_meansOfIdentification_elements_implies_ontology
    {i : Elements.Item} {c : ComplaintText}
    (h : Elements.MeansOfIdentificationOfAnother i c) :
    Ontology.MeansOfIdentificationMembership (mapItemOId i) c :=
  ⟨corr_moi_membership h.meansOfIdentification,
   corr_moi_nameOrNumber h.meansOfIdentification,
   corr_moi_identifies h.meansOfIdentification⟩



axiom corr_c1_gov_EP {i : Elements.Item} (p : Person) (pr : Procedure.Prosecution)
    {c : ComplaintText} :
    Elements.DocumentIssuedOrAppearsIssuedUnderUnitedStatesAuthority i c →
    Procedure.DocumentIsUnitedStatesOrSpecialEventIssued p pr c
axiom corr_c1_impl_EP {i : Elements.Item} (p : Person) (pr : Procedure.Prosecution)
    {c : ComplaintText} :
    Elements.ImplementSuitedForUnitedStatesDocument i c →
    Procedure.DocumentIsUnitedStatesOrSpecialEventIssued p pr c
axiom corr_c2_EP {p : Person} {i : Elements.Item} (pr : Procedure.Prosecution)
    {c : ComplaintText} :
    Elements.Section1028a4 p i c →
    Procedure.OffenseIsDefraudUnitedStatesPossession p pr c
axiom corr_c3_commerce_EP {p : Person} (pr : Procedure.Prosecution)
    {c : ComplaintText} :
    Elements.EngagedInInterstateOrForeignCommerce p c →
    Procedure.AffectsInterstateOrForeignCommerce p pr c
axiom corr_c3_mail_EP {i : Elements.Item} (p : Person) (pr : Procedure.Prosecution)
    {c : ComplaintText} :
    Elements.ItemTransportedInTheMail i c → Procedure.TransportedInTheMail p pr c



theorem s1028c_elements_implies_procedure {p : Person} {i : Elements.Item}
    (pr : Procedure.Prosecution) {c : ComplaintText}
    (h : Elements.Circumstance1028c p i c) :
    Procedure.Section1028Circumstance p pr c :=
  match h with
  | .governmentalDocument hx => Or.inl (corr_c1_gov_EP p pr hx)
  | .implementSuited hx => Or.inl (corr_c1_impl_EP p pr hx)
  | .offenseUnderA4 hx => Or.inr (Or.inl (corr_c2_EP pr hx))
  | .commerce hx => Or.inr (Or.inr (Or.inl (corr_c3_commerce_EP pr hx)))
  | .mail hx => Or.inr (Or.inr (Or.inr (corr_c3_mail_EP p pr hx)))


axiom corr_exempt1028_PE {p : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.LawfullyAuthorizedInvestigativeActivity p pr c →
    Elements.LawfullyAuthorizedInvestigativeOrIntelligenceActivity p c









theorem s1028_elements_implies_procedure {p : Person} {i : Elements.Item}
    {items : List Elements.Item} {pr : Procedure.Prosecution} {c : ComplaintText}
    (h : Elements.ViolationOfSection1028 p i items c)
    (hCharge : Procedure.ChargeInstituted p pr c) :
    Procedure.ProsecutionCognizable1028 p pr c :=
  ⟨s1028c_elements_implies_procedure pr h.circumstance, hCharge,
   fun hx => h.notExcluded (corr_exempt1028_PE hx)⟩

axiom corr_c1_DP {d : Deontic.IdentificationArtifact} (p : Person)
    (pr : Procedure.Prosecution) {c : ComplaintText} :
    Deontic.CircumstanceUnitedStatesDocument1028c1 d c →
    Procedure.DocumentIsUnitedStatesOrSpecialEventIssued p pr c
axiom corr_c2_DP {p : Person} (pr : Procedure.Prosecution) {c : ComplaintText} :
    Deontic.CircumstanceIsSubsectionA4Offense1028c2 p c →
    Procedure.OffenseIsDefraudUnitedStatesPossession p pr c
axiom corr_c3_DP {p : Person} {d : Deontic.IdentificationArtifact}
    (pr : Procedure.Prosecution) {c : ComplaintText} :
    Deontic.CircumstanceInterstateCommerceOrMail1028c3 p d c →
    Procedure.AffectsInterstateOrForeignCommerce p pr c ∨
      Procedure.TransportedInTheMail p pr c




theorem s1028c_deontic_implies_procedure {p : Person}
    (pr : Procedure.Prosecution) {c : ComplaintText}
    (h : Deontic.Circumstance1028c p c) :
    Procedure.Section1028Circumstance p pr c :=
  match h with
  | .unitedStatesDocument _ hx => Or.inl (corr_c1_DP p pr hx)
  | .subsectionA4Offense hx => Or.inr (Or.inl (corr_c2_DP pr hx))
  | .interstateCommerceOrMail _ hx =>
      match corr_c3_DP pr hx with
      | Or.inl hc => Or.inr (Or.inr (Or.inl hc))
      | Or.inr hm => Or.inr (Or.inr (Or.inr hm))


axiom corr_exempt1028_PD {p : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.LawfullyAuthorizedInvestigativeActivity p pr c →
    Deontic.LawfullyAuthorizedActivityExempt1028e p c



theorem s1028_deontic_implies_procedure {p : Person}
    {pr : Procedure.Prosecution} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated1028a p c)
    (hCharge : Procedure.ChargeInstituted p pr c) :
    Procedure.ProsecutionCognizable1028 p pr c :=
  ⟨s1028c_deontic_implies_procedure pr h.1.condition, hCharge,
   fun hx => h.2.2 (corr_exempt1028_PD hx)⟩






axiom gap_1028_conduct (p : Person) (i : Elements.Item)
    (items : List Elements.Item) (c : ComplaintText) : Prop

axiom corr_gap_conduct1028 {p : Person} {i : Elements.Item}
    {items : List Elements.Item} {c : ComplaintText} :
    gap_1028_conduct p i items c → Elements.ProhibitedConduct1028a p i items c
axiom corr_c1_gov_PE {p : Person} {pr : Procedure.Prosecution} (i : Elements.Item)
    {c : ComplaintText} :
    Procedure.DocumentIsUnitedStatesOrSpecialEventIssued p pr c →
    Elements.DocumentIssuedOrAppearsIssuedUnderUnitedStatesAuthority i c
axiom corr_c2_PE {p : Person} {pr : Procedure.Prosecution} (i : Elements.Item)
    {c : ComplaintText} :
    Procedure.OffenseIsDefraudUnitedStatesPossession p pr c →
    Elements.Section1028a4 p i c
axiom corr_c3_commerce_PE {p : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.AffectsInterstateOrForeignCommerce p pr c →
    Elements.EngagedInInterstateOrForeignCommerce p c
axiom corr_c3_mail_PE {p : Person} {pr : Procedure.Prosecution} (i : Elements.Item)
    {c : ComplaintText} :
    Procedure.TransportedInTheMail p pr c → Elements.ItemTransportedInTheMail i c
axiom corr_exempt1028_EP {p : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Elements.LawfullyAuthorizedInvestigativeOrIntelligenceActivity p c →
    Procedure.LawfullyAuthorizedInvestigativeActivity p pr c




theorem s1028_procedure_implies_elements_modulo_gaps {p : Person}
    {i : Elements.Item} {items : List Elements.Item}
    {pr : Procedure.Prosecution} {c : ComplaintText}
    (h : Procedure.ProsecutionCognizable1028 p pr c)
    (hGap : gap_1028_conduct p i items c) :
    Elements.ViolationOfSection1028 p i items c :=
  ⟨corr_gap_conduct1028 hGap,
   match h.circumstance with
   | Or.inl hx => .governmentalDocument (corr_c1_gov_PE i hx)
   | Or.inr (Or.inl hx) => .offenseUnderA4 (corr_c2_PE i hx)
   | Or.inr (Or.inr (Or.inl hx)) => .commerce (corr_c3_commerce_PE hx)
   | Or.inr (Or.inr (Or.inr hx)) => .mail (corr_c3_mail_PE i hx),
   fun he => h.noExemption (corr_exempt1028_EP he)⟩




axiom corr_exempt1028_PO {p : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.LawfullyAuthorizedInvestigativeActivity p pr c →
    Ontology.IsLawfullyAuthorizedInvestigativeActivity (actOf1028 p c) c





theorem s1028e_ontology_implies_procedure {p : Person}
    (pr : Procedure.Prosecution) {c : ComplaintText}
    (h : Ontology.NonExemptCoveredAct (actOf1028 p c) c) :
    ¬ Procedure.LawfullyAuthorizedInvestigativeActivity p pr c :=
  fun hx => h.notExempt (corr_exempt1028_PO hx)

end S1028



namespace S1029



axiom corr_addressee1029 (p : Person) (c : ComplaintText) :
    Deontic.AddresseeWhoever1029a p c


axiom corr_commerce1029_ED {p : Person} {c : ComplaintText} :
    Elements.EngagedInInterstateOrForeignCommerce p c →
    Deontic.AffectsInterstateOrForeignCommerce1029a p c

axiom corr_extra_outside_ED {p : Person} {c : ComplaintText} :
    Elements.ActOutsideUnitedStatesJurisdiction p c →
    Deontic.ActsOutsideUnitedStatesJurisdiction1029h p c

axiom corr_extra_device_ED {d : Elements.Device} (p : Person) {c : ComplaintText} :
    Elements.DeviceLinkedToUnitedStatesEntity d c →
    Deontic.InvolvesUnitedStatesConnectedAccessDevice1029h p c

axiom corr_b1 {p : Person} {devices : List Elements.Device} {c : ComplaintText} :
    Elements.Section1029a1 p devices c →
    Deontic.ProducesUsesOrTrafficsCounterfeitDevice1029a1 p (mapDevicesED devices) c
axiom corr_b2 {p : Person} {devices : List Elements.Device} {agg span : Nat}
    {c : ComplaintText} :
    Elements.Section1029a2 p devices agg span c →
    Deontic.TrafficsOrUsesUnauthorizedDevices1029a2 p (mapDevicesED devices) c
axiom corr_b3 {p : Person} {devices : List Elements.Device} {c : ComplaintText} :
    Elements.Section1029a3 p devices c →
    Deontic.PossessesFifteenOrMoreDevices1029a3 p c
axiom corr_b4 {p : Person} {d : Elements.Device} {c : ComplaintText} :
    Elements.Section1029a4 p d c →
    Deontic.ProducesOrPossessesDeviceMakingEquipment1029a4 p (mapDeviceED d) c
axiom corr_b5 {p : Person} {devices : List Elements.Device} {agg span : Nat}
    {c : ComplaintText} :
    Elements.Section1029a5 p devices agg span c →
    Deontic.EffectsTransactionsWithAnothersDevices1029a5 p (mapDevicesED devices) c
axiom corr_b6 {p : Person} {c : ComplaintText} :
    Elements.Section1029a6 p c →
    Deontic.SolicitsWithoutIssuerAuthorization1029a6 p (artifactOfPerson1029 p c) c
axiom corr_b7 {p : Person} {d : Elements.Device} {c : ComplaintText} :
    Elements.Section1029a7 p d c →
    Deontic.UsesModifiedTelecommunicationsInstrument1029a7 p (mapDeviceED d) c
axiom corr_b8 {p : Person} {d : Elements.Device} {c : ComplaintText} :
    Elements.Section1029a8 p d c →
    Deontic.UsesScanningReceiver1029a8 p (mapDeviceED d) c
axiom corr_b9 {p : Person} {d : Elements.Device} {c : ComplaintText} :
    Elements.Section1029a9 p d c →
    Deontic.UsesConfiguredHardwareOrSoftware1029a9 p (mapDeviceED d) c
axiom corr_b10 {p : Person} {c : ComplaintText} :
    Elements.Section1029a10 p c →
    Deontic.ArrangesPresentationOfTransactionRecords1029a10 p
      (artifactOfPerson1029 p c) c


theorem act1029_ED {p : Person} {d : Elements.Device}
    {devices : List Elements.Device} {agg span : Nat} {c : ComplaintText}
    (h : Elements.ProhibitedConduct1029a p d devices agg span c) :
    Deontic.ProhibitedAct1029a p c :=
  match h with
  | .counterfeitDevices hx => .counterfeitDevice (mapDevicesED devices) (corr_b1 hx)
  | .unauthorizedDevices hx => .unauthorizedDevices (mapDevicesED devices) (corr_b2 hx)
  | .fifteenOrMoreDevices hx => .fifteenOrMoreDevices (corr_b3 hx)
  | .deviceMakingEquipment hx => .deviceMakingEquipment (mapDeviceED d) (corr_b4 hx)
  | .transactionsWithAnothersDevice hx =>
      .transactionsWithAnothersDevices (mapDevicesED devices) (corr_b5 hx)
  | .solicitation hx => .unauthorizedSolicitation (artifactOfPerson1029 p c) (corr_b6 hx)
  | .modifiedInstrument hx => .modifiedTelecomInstrument (mapDeviceED d) (corr_b7 hx)
  | .scanningReceiver hx => .scanningReceiver (mapDeviceED d) (corr_b8 hx)
  | .configuredHardware hx => .configuredHardwareOrSoftware (mapDeviceED d) (corr_b9 hx)
  | .transactionRecords hx => .arrangedPresentation (artifactOfPerson1029 p c) (corr_b10 hx)


axiom corr_domestic_ED {p : Person} {d : Elements.Device}
    {devices : List Elements.Device} {agg span : Nat} {c : ComplaintText} :
    Elements.ProhibitedConduct1029a p d devices agg span c →
    Deontic.ConductWouldConstituteOffenseIfDomestic1029h p c


axiom corr_exempt1029_DE {p : Person} {c : ComplaintText} :
    Deontic.LawfullyAuthorizedActivityExempt1029f p c →
    Elements.LawfullyAuthorizedInvestigativeOrIntelligenceActivity p c








theorem s1029_elements_implies_deontic {p : Person} {d : Elements.Device}
    {devices : List Elements.Device} {agg span : Nat} {c : ComplaintText}
    (h : Elements.ViolationOfSection1029 p d devices agg span c) :
    Deontic.ProhibitionViolated1029a p c ∨ Deontic.ProhibitionViolated1029h p c :=
  match h.jurisdiction with
  | .commerce hx =>
      Or.inl ⟨⟨corr_addressee1029 p c, corr_commerce1029_ED hx⟩,
        act1029_ED h.conduct, fun he => h.notExcluded (corr_exempt1029_DE he)⟩
  | .extraterritorial hOutside hDevice =>
      Or.inr ⟨⟨corr_addressee1029 p c, corr_extra_outside_ED hOutside,
          corr_extra_device_ED p hDevice⟩,
        corr_domestic_ED h.conduct,
        fun he => h.notExcluded (corr_exempt1029_DE he)⟩



axiom corr_act1029_DO {p : Person} {c : ComplaintText} :
    Deontic.ProhibitedAct1029a p c →
    Ontology.ProduceS1029Membership (actOf1029 p c) c ∨
      Ontology.TrafficS1029Membership (actOf1029 p c) c
axiom corr_exempt1029_OD {p : Person} {c : ComplaintText} :
    Ontology.IsLawfullyAuthorizedInvestigativeActivity (actOf1029 p c) c →
    Deontic.LawfullyAuthorizedActivityExempt1029f p c






theorem s1029_deontic_implies_ontology {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated1029a p c) :
    (Ontology.ProduceS1029Membership (actOf1029 p c) c ∨
      Ontology.TrafficS1029Membership (actOf1029 p c) c) ∧
    ¬ Ontology.IsLawfullyAuthorizedInvestigativeActivity (actOf1029 p c) c :=
  ⟨corr_act1029_DO h.2.1, fun hx => h.2.2 (corr_exempt1029_OD hx)⟩



axiom corr_accessDevice_membership {d : Elements.Device} {c : ComplaintText} :
    Elements.IsAccessDevice d c → Ontology.IsAccessDevice (mapDeviceOD d) c
axiom corr_accessDevice_means {d : Elements.Device} {c : ComplaintText} :
    Elements.IsAccessDevice d c → Ontology.IsAccountAccessMeans (mapDeviceOD d) c
axiom corr_accessDevice_value {d : Elements.Device} {c : ComplaintText} :
    Elements.IsAccessDevice d c → Ontology.CanObtainThingOfValue (mapDeviceOD d) c

axiom corr_counterfeit_membership {d : Elements.Device} {c : ComplaintText} :
    Elements.IsCounterfeitAccessDevice d c →
    Ontology.IsCounterfeitAccessDevice (mapDeviceOD d) c
axiom corr_counterfeit_isDevice {d : Elements.Device} {c : ComplaintText} :
    Elements.IsCounterfeitAccessDevice d c → Ontology.IsAccessDevice (mapDeviceOD d) c
axiom corr_counterfeit_forged {d : Elements.Device} {c : ComplaintText} :
    Elements.IsCounterfeitAccessDevice d c →
    Ontology.IsCounterfeitFictitiousAlteredOrForged (mapDeviceOD d) c

axiom corr_unauthorized_membership {d : Elements.Device} {c : ComplaintText} :
    Elements.IsUnauthorizedAccessDevice d c →
    Ontology.IsUnauthorizedAccessDevice (mapDeviceOD d) c
axiom corr_unauthorized_isDevice {d : Elements.Device} {c : ComplaintText} :
    Elements.IsUnauthorizedAccessDevice d c → Ontology.IsAccessDevice (mapDeviceOD d) c
axiom corr_unauthorized_status {d : Elements.Device} {c : ComplaintText} :
    Elements.IsUnauthorizedAccessDevice d c →
    Ontology.IsLostStolenExpiredRevokedOrCanceled (mapDeviceOD d) c




theorem s1029e_objects_elements_implies_ontology {d : Elements.Device}
    {c : ComplaintText} (h : Elements.CounterfeitOrUnauthorizedDevice d c) :
    Ontology.CounterfeitAccessDeviceMembership (mapDeviceOD d) c ∨
      Ontology.UnauthorizedAccessDeviceMembership (mapDeviceOD d) c :=
  match h with
  | .counterfeit hx =>
      Or.inl (.falsifiedDevice (corr_counterfeit_membership hx)
        (corr_counterfeit_isDevice hx) (corr_counterfeit_forged hx))
  | .unauthorized hx =>
      Or.inr (.statusDefect (corr_unauthorized_membership hx)
        (corr_unauthorized_isDevice hx) (corr_unauthorized_status hx))



theorem s1029e1_accessDevice_elements_implies_ontology {d : Elements.Device}
    {c : ComplaintText} (h : Elements.IsAccessDevice d c) :
    Ontology.AccessDeviceMembership (mapDeviceOD d) c :=
  ⟨corr_accessDevice_membership h, corr_accessDevice_means h,
   .obtainsValue (corr_accessDevice_value h)⟩



axiom corr_commerce1029_EP {p : Person} (pr : Procedure.Prosecution)
    {c : ComplaintText} :
    Elements.EngagedInInterstateOrForeignCommerce p c →
    Procedure.AffectsInterstateOrForeignCommerce p pr c
axiom corr_outside1029_EP {p : Person} (pr : Procedure.Prosecution)
    {c : ComplaintText} :
    Elements.ActOutsideUnitedStatesJurisdiction p c →
    Procedure.ConductOutsideUnitedStatesJurisdiction p pr c
axiom corr_deviceNexus1029_EP {d : Elements.Device} (p : Person)
    (pr : Procedure.Prosecution) {c : ComplaintText} :
    Elements.DeviceLinkedToUnitedStatesEntity d c →
    Procedure.AccessDeviceControlledByUnitedStatesEntity p pr c




theorem s1029j_elements_implies_procedure {p : Person} {d : Elements.Device}
    (pr : Procedure.Prosecution) {c : ComplaintText}
    (h : Elements.Jurisdiction1029 p d c) :
    Procedure.Section1029JurisdictionalBasis p pr c :=
  match h with
  | .commerce hx => Or.inl (corr_commerce1029_EP pr hx)
  | .extraterritorial hOutside hDevice =>
      Or.inr ⟨corr_outside1029_EP pr hOutside, corr_deviceNexus1029_EP p pr hDevice⟩


axiom corr_exempt1029_PE {p : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.LawfullyAuthorizedInvestigativeActivity p pr c →
    Elements.LawfullyAuthorizedInvestigativeOrIntelligenceActivity p c



theorem s1029_elements_implies_procedure {p : Person} {d : Elements.Device}
    {devices : List Elements.Device} {agg span : Nat}
    {pr : Procedure.Prosecution} {c : ComplaintText}
    (h : Elements.ViolationOfSection1029 p d devices agg span c)
    (hCharge : Procedure.ChargeInstituted p pr c) :
    Procedure.ProsecutionCognizable1029 p pr c :=
  ⟨s1029j_elements_implies_procedure pr h.jurisdiction, hCharge,
   fun hx => h.notExcluded (corr_exempt1029_PE hx)⟩





axiom gap_1029_conduct (p : Person) (d : Elements.Device)
    (devices : List Elements.Device) (agg span : Nat) (c : ComplaintText) : Prop

axiom corr_gap_conduct {p : Person} {d : Elements.Device}
    {devices : List Elements.Device} {agg span : Nat} {c : ComplaintText} :
    gap_1029_conduct p d devices agg span c →
    Elements.ProhibitedConduct1029a p d devices agg span c
axiom corr_commerce1029_PE {p : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.AffectsInterstateOrForeignCommerce p pr c →
    Elements.EngagedInInterstateOrForeignCommerce p c
axiom corr_outside1029_PE {p : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.ConductOutsideUnitedStatesJurisdiction p pr c →
    Elements.ActOutsideUnitedStatesJurisdiction p c
axiom corr_deviceNexus1029_PE {p : Person} {pr : Procedure.Prosecution}
    (d : Elements.Device) {c : ComplaintText} :
    Procedure.AccessDeviceControlledByUnitedStatesEntity p pr c →
    Elements.DeviceLinkedToUnitedStatesEntity d c
axiom corr_exempt1029_EP {p : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Elements.LawfullyAuthorizedInvestigativeOrIntelligenceActivity p c →
    Procedure.LawfullyAuthorizedInvestigativeActivity p pr c







theorem s1029_procedure_implies_elements_modulo_gaps {p : Person}
    {d : Elements.Device} {devices : List Elements.Device} {agg span : Nat}
    {pr : Procedure.Prosecution} {c : ComplaintText}
    (h : Procedure.ProsecutionCognizable1029 p pr c)
    (hGap : gap_1029_conduct p d devices agg span c) :
    Elements.ViolationOfSection1029 p d devices agg span c :=
  ⟨corr_gap_conduct hGap,
   match h.jurisdiction with
   | Or.inl hc => .commerce (corr_commerce1029_PE hc)
   | Or.inr hx => .extraterritorial (corr_outside1029_PE hx.1)
       (corr_deviceNexus1029_PE d hx.2),
   fun he => h.noExemption (corr_exempt1029_EP he)⟩

axiom corr_commerce1029_DP {p : Person} (pr : Procedure.Prosecution)
    {c : ComplaintText} :
    Deontic.AffectsInterstateOrForeignCommerce1029a p c →
    Procedure.AffectsInterstateOrForeignCommerce p pr c
axiom corr_exempt1029_PD {p : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.LawfullyAuthorizedInvestigativeActivity p pr c →
    Deontic.LawfullyAuthorizedActivityExempt1029f p c



theorem s1029_deontic_implies_procedure {p : Person}
    {pr : Procedure.Prosecution} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated1029a p c)
    (hCharge : Procedure.ChargeInstituted p pr c) :
    Procedure.ProsecutionCognizable1029 p pr c :=
  ⟨Or.inl (corr_commerce1029_DP pr h.1.condition), hCharge,
   fun hx => h.2.2 (corr_exempt1029_PD hx)⟩



axiom corr_exempt1029_PO {p : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.LawfullyAuthorizedInvestigativeActivity p pr c →
    Ontology.IsLawfullyAuthorizedInvestigativeActivity (actOf1029 p c) c



theorem s1029f_ontology_implies_procedure {p : Person}
    (pr : Procedure.Prosecution) {c : ComplaintText}
    (h : ¬ Ontology.IsLawfullyAuthorizedInvestigativeActivity (actOf1029 p c) c) :
    ¬ Procedure.LawfullyAuthorizedInvestigativeActivity p pr c :=
  fun hx => h (corr_exempt1029_PO hx)

end S1029


















namespace Golden

axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText

axiom rackAct1028 : Person → ComplaintText → Proving.Rico.Act

axiom rackAct1029 : Person → ComplaintText → Proving.Rico.Act



axiom corr_1028_B {p : Person} {i : Elements.Item} {items : List Elements.Item}
    {c : ComplaintText} :
    Elements.ViolationOfSection1028 p i items c →
    Proving.Rico.IsRacketeeringActivity (rackAct1028 p c) (mapComplaint c)


theorem s1028_elements_implies_rico_1961B {p : Person} {i : Elements.Item}
    {items : List Elements.Item} {c : ComplaintText}
    (h : Elements.ViolationOfSection1028 p i items c) :
    Proving.Rico.IsRacketeeringActivity (rackAct1028 p c) (mapComplaint c) :=
  corr_1028_B h



axiom corr_1029_B {p : Person} {d : Elements.Device}
    {devices : List Elements.Device} {agg span : Nat} {c : ComplaintText} :
    Elements.ViolationOfSection1029 p d devices agg span c →
    Proving.Rico.IsRacketeeringActivity (rackAct1029 p c) (mapComplaint c)


theorem s1029_elements_implies_rico_1961B {p : Person} {d : Elements.Device}
    {devices : List Elements.Device} {agg span : Nat} {c : ComplaintText}
    (h : Elements.ViolationOfSection1029 p d devices agg span c) :
    Proving.Rico.IsRacketeeringActivity (rackAct1029 p c) (mapComplaint c) :=
  corr_1029_B h

end Golden









#check @Elements.ViolationOfSection1028
#check @Elements.ViolationOfSection1029
#check @Deontic.ProhibitionViolated1028a
#check @Deontic.ProhibitionViolated1029a
#check @Deontic.ProhibitionViolated1029h
#check @Ontology.NonExemptCoveredAct
#check @Ontology.IdentificationDocumentMembership
#check @Ontology.AccessDeviceMembership
#check @Procedure.ProsecutionCognizable1028
#check @Procedure.ProsecutionCognizable1029
#check @Structure.Coherent1028
#check @Structure.Coherent1029

end Proving.USC.T18.Ch47.Bridge
