









































import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.Predicates
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Elements.Predicates
import Proving.USC.T18.Ch2.Procedure.Predicates
import Proving.USC.T18.Ch2.Elements.Predicates
import Proving.USC.T18.Ch3.Procedure.Predicates
import Proving.USC.T42.Ch6ASchI.Structure.Predicates
import Proving.USC.T42.Ch2Ch6.Structure.Predicates
import Proving.USC.T42.Ch2Ch6.Procedure.Predicates
import Proving.USC.T42.Ch6ASchI.Deontic.Predicates

namespace Proving.USC.Common.CrossWaveCollapseD6
open Proving.USC.Common


axiom mapRef_T18Crim    : Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.Ref → StructRef
axiom mapRef_T42Ch6ASchI : Proving.USC.T42.Ch6ASchI.Structure.Ref → StructRef
axiom mapRef_T42Ch2Ch6   : Proving.USC.T42.Ch2Ch6.Structure.Ref → StructRef


axiom guard_T18Crim    (r : Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.Ref) (c : ComplaintText) : Prop
axiom guard_T42Ch6ASchI (r : Proving.USC.T42.Ch6ASchI.Structure.Ref) (c : ComplaintText) : Prop
axiom guard_T42Ch2Ch6   (r : Proving.USC.T42.Ch2Ch6.Structure.Ref) (c : ComplaintText) : Prop








axiom corr_t18crim_refExists {r : Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T18Crim r) c
theorem collapse_t18crim_refExists {r : Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T18Crim r) c := corr_t18crim_refExists h

axiom corr_t42adm_refExists {r : Proving.USC.T42.Ch6ASchI.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T42.Ch6ASchI.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T42Ch6ASchI r) c
theorem collapse_t42adm_refExists {r : Proving.USC.T42.Ch6ASchI.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T42.Ch6ASchI.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T42Ch6ASchI r) c := corr_t42adm_refExists h


axiom corr_t18crim_incorp {r : Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.Ref} {c : ComplaintText} :
    guard_T18Crim r c → Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T18Crim r) c
theorem collapse_t18crim_incorp {r : Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.Ref} {c : ComplaintText}
    (hg : guard_T18Crim r c) (h : Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T18Crim r) c := corr_t18crim_incorp hg h

axiom corr_t42adm_incorp {r : Proving.USC.T42.Ch6ASchI.Structure.Ref} {c : ComplaintText} :
    guard_T42Ch6ASchI r c → Proving.USC.T42.Ch6ASchI.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T42Ch6ASchI r) c
theorem collapse_t42adm_incorp {r : Proving.USC.T42.Ch6ASchI.Structure.Ref} {c : ComplaintText}
    (hg : guard_T42Ch6ASchI r c) (h : Proving.USC.T42.Ch6ASchI.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T42Ch6ASchI r) c := corr_t42adm_incorp hg h


axiom corr_t18crim_except {r : Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.Ref} {c : ComplaintText} :
    guard_T18Crim r c → Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRef_T18Crim r) c
theorem collapse_t18crim_except {r : Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.Ref} {c : ComplaintText}
    (hg : guard_T18Crim r c) (h : Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRef_T18Crim r) c := corr_t18crim_except hg h

axiom corr_t42adm_except {r : Proving.USC.T42.Ch6ASchI.Structure.Ref} {c : ComplaintText} :
    guard_T42Ch6ASchI r c → Proving.USC.T42.Ch6ASchI.Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRef_T42Ch6ASchI r) c
theorem collapse_t42adm_except {r : Proving.USC.T42.Ch6ASchI.Structure.Ref} {c : ComplaintText}
    (hg : guard_T42Ch6ASchI r c) (h : Proving.USC.T42.Ch6ASchI.Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRef_T42Ch6ASchI r) c := corr_t42adm_except hg h


axiom corr_t18crim_override {r : Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.Ref} {c : ComplaintText} :
    guard_T18Crim r c → Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRef_T18Crim r) c
theorem collapse_t18crim_override {r : Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.Ref} {c : ComplaintText}
    (hg : guard_T18Crim r c) (h : Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRef_T18Crim r) c := corr_t18crim_override hg h

axiom corr_t42adm_override {r : Proving.USC.T42.Ch6ASchI.Structure.Ref} {c : ComplaintText} :
    guard_T42Ch6ASchI r c → Proving.USC.T42.Ch6ASchI.Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRef_T42Ch6ASchI r) c
theorem collapse_t42adm_override {r : Proving.USC.T42.Ch6ASchI.Structure.Ref} {c : ComplaintText}
    (hg : guard_T42Ch6ASchI r c) (h : Proving.USC.T42.Ch6ASchI.Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRef_T42Ch6ASchI r) c := corr_t42adm_override hg h


axiom corr_t18crim_savings {r : Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.Ref} {c : ComplaintText} :
    guard_T18Crim r c → Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.SavingsPreserved r c →
    StructuralReferenceCoheres (mapRef_T18Crim r) c
theorem collapse_t18crim_savings {r : Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.Ref} {c : ComplaintText}
    (hg : guard_T18Crim r c) (h : Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.SavingsPreserved r c) :
    StructuralReferenceCoheres (mapRef_T18Crim r) c := corr_t18crim_savings hg h

axiom corr_t42ch2ch6_savings {r : Proving.USC.T42.Ch2Ch6.Structure.Ref} {c : ComplaintText} :
    guard_T42Ch2Ch6 r c → Proving.USC.T42.Ch2Ch6.Structure.SavingsClausePreserved r c →
    StructuralReferenceCoheres (mapRef_T42Ch2Ch6 r) c
theorem collapse_t42ch2ch6_savings {r : Proving.USC.T42.Ch2Ch6.Structure.Ref} {c : ComplaintText}
    (hg : guard_T42Ch2Ch6 r c) (h : Proving.USC.T42.Ch2Ch6.Structure.SavingsClausePreserved r c) :
    StructuralReferenceCoheres (mapRef_T42Ch2Ch6 r) c := corr_t42ch2ch6_savings hg h







axiom corr_t18crim_commerce {c : ComplaintText} :
    Proving.USC.T18.Ch5Ch7Ch9Ch10.Elements.AffectsInterstateOrForeignCommerce c →
    FederalJurisdictionalNexus c
theorem collapse_t18crim_commerce {c : ComplaintText}
    (h : Proving.USC.T18.Ch5Ch7Ch9Ch10.Elements.AffectsInterstateOrForeignCommerce c) :
    FederalJurisdictionalNexus c := corr_t18crim_commerce h

axiom corr_t18ch2_commerce {c : ComplaintText} :
    Proving.USC.T18.Ch2.Procedure.AffectsInterstateOrForeignCommerce c →
    FederalJurisdictionalNexus c
theorem collapse_t18ch2_commerce {c : ComplaintText}
    (h : Proving.USC.T18.Ch2.Procedure.AffectsInterstateOrForeignCommerce c) :
    FederalJurisdictionalNexus c := corr_t18ch2_commerce h


axiom corr_t18crim_smtj {c : ComplaintText} :
    Proving.USC.T18.Ch5Ch7Ch9Ch10.Elements.WithinSpecialMaritimeTerritorialJurisdiction c →
    FederalJurisdictionalNexus c
theorem collapse_t18crim_smtj {c : ComplaintText}
    (h : Proving.USC.T18.Ch5Ch7Ch9Ch10.Elements.WithinSpecialMaritimeTerritorialJurisdiction c) :
    FederalJurisdictionalNexus c := corr_t18crim_smtj h


axiom corr_t18ch2_nationality {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch2.Procedure.OffenderOrVictimUSNational p c →
    FederalJurisdictionalNexus c
theorem collapse_t18ch2_nationality {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Ch2.Procedure.OffenderOrVictimUSNational p c) :
    FederalJurisdictionalNexus c := corr_t18ch2_nationality h





axiom corr_t18crim_scienter {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch5Ch7Ch9Ch10.Elements.ActedKnowinglyAndFraudulently p c →
    MentalStateProven p MentalState.Knowledge c
theorem collapse_t18crim_scienter {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Ch5Ch7Ch9Ch10.Elements.ActedKnowinglyAndFraudulently p c) :
    MentalStateProven p MentalState.Knowledge c := corr_t18crim_scienter h






axiom corr_t18crim_scheme_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch5Ch7Ch9Ch10.Elements.DevisedSchemeToDefraud p c ↔ SchemeToDefraudDevised p c
theorem collapse_t18crim_scheme {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Ch5Ch7Ch9Ch10.Elements.DevisedSchemeToDefraud p c) :
    SchemeToDefraudDevised p c := corr_t18crim_scheme_iff.mp h

axiom corr_t18ch2_intentDefraud {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch2.Elements.IntentToDefraud p c → ActedWithScienter p c
theorem collapse_t18ch2_intentDefraud {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Ch2.Elements.IntentToDefraud p c) :
    ActedWithScienter p c := corr_t18ch2_intentDefraud h





axiom corr_convEntered_ch2 {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch2.Procedure.ConvictedOfChapterCrime p c → ConvictionEntered p c
theorem mint_convEntered_ch2 {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Ch2.Procedure.ConvictedOfChapterCrime p c) :
    ConvictionEntered p c := corr_convEntered_ch2 h

axiom corr_convEntered_ch3 {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch3.Procedure.ConvictionEntered p c → ConvictionEntered p c
theorem mint_convEntered_ch3 {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Ch3.Procedure.ConvictionEntered p c) :
    ConvictionEntered p c := corr_convEntered_ch3 h





axiom corr_appt_ch2ch6 {c : ComplaintText} :
    Proving.USC.T42.Ch2Ch6.Procedure.AppointedWithSenateAdviceAndConsent c →
    AppointedWithSenateAdviceAndConsent c
theorem mint_appt_ch2ch6 {c : ComplaintText}
    (h : Proving.USC.T42.Ch2Ch6.Procedure.AppointedWithSenateAdviceAndConsent c) :
    AppointedWithSenateAdviceAndConsent c := corr_appt_ch2ch6 h

axiom corr_appt_schiA {c : ComplaintText} :
    Proving.USC.T42.Ch6ASchI.Deontic.SenateAdviceAndConsent205 c →
    AppointedWithSenateAdviceAndConsent c
theorem mint_appt_schiA {c : ComplaintText}
    (h : Proving.USC.T42.Ch6ASchI.Deontic.SenateAdviceAndConsent205 c) :
    AppointedWithSenateAdviceAndConsent c := corr_appt_schiA h

end Proving.USC.Common.CrossWaveCollapseD6
