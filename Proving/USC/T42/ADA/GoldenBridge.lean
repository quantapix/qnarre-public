

















































import Proving.USC.T42.ADA.Elements.Statute
import Proving.USC.T42.ADA.Deontic.Statute
import Proving.ADA.Theorems
import Proving.USC.Common.Types

namespace Proving.USC.T42.ADA.GoldenBridge

open Proving.USC.Common









axiom gPerson    : Person → Proving.ADA.Person
axiom gComplaint : ComplaintText → Proving.ADA.ComplaintText
axiom gCE_emp    : Elements.CoveredEntity → Proving.ADA.CoveredEntity
axiom gCE_pub    : Elements.PublicEntity → Proving.ADA.CoveredEntity
axiom gCE_pa     : Elements.PublicAccommodation → Proving.ADA.CoveredEntity
axiom gAct_emp   : Elements.EmploymentAction → Proving.ADA.Action
axiom gAct_pub   : Elements.PublicService → Proving.ADA.Action
axiom gAct_pa    : Elements.AccommodationAct → Proving.ADA.Action
axiom gProg_pub  : Elements.PublicService → Proving.ADA.Program
axiom gProg_pa   : Elements.PublicAccommodation → Proving.ADA.Program

def gGround : Proving.ADA.ProtectedGround := Proving.ADA.ProtectedGround.disability







axiom corr_disability {p c} :
    Elements.HasDisability p c → Proving.ADA.HasDisability (gPerson p) (gComplaint c)



axiom corr_t1_qualified {p c} :
    Elements.IsQualifiedIndividualEmployment p c →
    Proving.ADA.IsQualifiedIndividualForEmployment (gPerson p) (gComplaint c)
axiom corr_t1_employer {ce c} :
    Elements.IsCoveredEntity ce c → Proving.ADA.IsCoveredEmployer (gCE_emp ce) (gComplaint c)
axiom corr_t1_onBasis {p a c} :
    Elements.ActionOnBasisOfDisability p a c →
    Proving.ADA.DiscriminatedAgainstOnBasisOfDisability (gAct_emp a) gGround (gComplaint c)
axiom corr_t1_adverse {a p c} :
    Elements.AdverseEmploymentActionTaken a c →
    Proving.ADA.AdverseEmploymentAction (gAct_emp a) (gPerson p) (gComplaint c)











axiom corr_employmentContext {a p c} :
    Proving.ADA.AdverseEmploymentAction a p c →
    Proving.ADA.OccursInEmploymentContext a c






theorem t1_disparate_implies_golden
    {p ce a c}
    (h : Elements.Section12112 p ce a c)
    : Proving.ADA.ValidADAComplaint (gPerson p) (gCE_emp ce) (gComplaint c) :=
  Proving.ADA.validADA_ofTitle1DisparateTreatment
    { coverage :=
        { disability := corr_disability h.disability
          employer := corr_t1_employer h.coveredEntity
          qualified := corr_t1_qualified h.qualified
          employmentContext :=
            corr_employmentContext (corr_t1_adverse (p := p) h.adverseAction) }
      onBasis := corr_t1_onBasis h.causation
      adverse := corr_t1_adverse h.adverseAction }


















axiom gAct_emp_of : Elements.CoveredEntity → Person → ComplaintText → Proving.ADA.Action
axiom corr_t1a_needed {ce p c} :
    Elements.FailedToReasonablyAccommodate ce p c →
    Proving.ADA.NeededReasonableAccommodation (gAct_emp_of ce p c) (gPerson p) (gComplaint c)
axiom corr_t1a_reasonable {ce p c} :
    ¬ Elements.AccommodationImposesUndueHardship ce c →
    Proving.ADA.AccommodationReasonableNotUndueHardship (gAct_emp_of ce p c) (gComplaint c)
axiom corr_t1a_failed {ce p c} :
    Elements.FailedToReasonablyAccommodate ce p c →
    Proving.ADA.EmployerFailedToAccommodate (gAct_emp_of ce p c) (gPerson p) (gComplaint c)
axiom corr_t1a_context {ce p c} :
    Elements.FailedToReasonablyAccommodate ce p c →
    Proving.ADA.OccursInEmploymentContext (gAct_emp_of ce p c) (gComplaint c)


theorem t1_accommodate_implies_golden
    {p ce c}
    (h : Elements.Section12112FailureToAccommodate p ce c)
    : Proving.ADA.ValidADAComplaint (gPerson p) (gCE_emp ce) (gComplaint c) :=
  Proving.ADA.validADA_ofTitle1FailureToAccommodate
    { coverage :=
        { disability := corr_disability h.disability
          employer := corr_t1_employer h.coveredEntity
          qualified := corr_t1_qualified h.qualified
          employmentContext := corr_t1a_context h.failed }
      needed := corr_t1a_needed h.failed
      reasonable := corr_t1a_reasonable h.notUndueHardship
      failed := corr_t1a_failed h.failed }













axiom corr_t2_publicEntity {pe c} :
    Elements.IsPublicEntity pe c → Proving.ADA.IsPublicEntity (gCE_pub pe) (gComplaint c)
axiom corr_t2_qualified {p c} :
    Elements.IsQualifiedIndividualPublicService p c →
    Proving.ADA.IsQualifiedIndividualForPublicService (gPerson p) (gComplaint c)
axiom corr_t2_disability {p c} :
    Elements.IsQualifiedIndividualPublicService p c →
    Proving.ADA.HasDisability (gPerson p) (gComplaint c)
axiom corr_t2_serviceOf {pe s c} :
    Elements.ExcludedFromPublicService s c →
    Proving.ADA.IsServiceOfPublicEntity (gProg_pub s) (gCE_pub pe) (gComplaint c)
axiom corr_t2_underService {s c} :
    Elements.ExcludedFromPublicService s c →
    Proving.ADA.OccursUnderService (gAct_pub s) (gProg_pub s) (gComplaint c)
axiom corr_t2_byReason {p s c} :
    Elements.ExclusionByReasonOfDisability p s c →
    Proving.ADA.ExcludedOrDeniedByReasonOfDisability (gAct_pub s) gGround (gComplaint c)


theorem t2_implies_golden
    {p pe s c}
    (h : Elements.Section12132 p pe s c)
    : Proving.ADA.ValidADAComplaint (gPerson p) (gCE_pub pe) (gComplaint c) :=
  Proving.ADA.validADA_ofTitle2
    { coverage :=
        { disability := corr_t2_disability h.qualified
          publicEntity := corr_t2_publicEntity h.publicEntity
          qualified := corr_t2_qualified h.qualified
          serviceOfEntity := corr_t2_serviceOf (pe := pe) h.excluded
          underService := corr_t2_underService h.excluded }
      byReason := corr_t2_byReason h.causation }











axiom corr_t3_place {pa c} :
    Elements.OperatesPublicAccommodation pa c →
    Proving.ADA.IsPlaceOfPublicAccommodation (gProg_pa pa) (gComplaint c)
axiom corr_t3_owns {pa d c} :
    Elements.OperatesPublicAccommodation pa c →
    Proving.ADA.OwnsLeasesOrOperates d (gProg_pa pa) (gComplaint c)
axiom corr_t3_enjoyment {a c} :
    Elements.DeniedFullEqualEnjoyment a c →
    Proving.ADA.ConcernsEnjoymentOfGoodsServices (gAct_pa a) (gComplaint c)
axiom corr_t3_onBasis {p a c} :
    Elements.DenialOnBasisOfDisability p a c →
    Proving.ADA.DiscriminatedOnBasisOfDisabilityInEnjoyment (gAct_pa a) (gPerson p) (gComplaint c)


theorem t3_disparate_implies_golden
    {p pa a c}
    (h : Elements.Section12182 p pa a c)
    : Proving.ADA.ValidADAComplaint (gPerson p) (gCE_pa pa) (gComplaint c) :=
  Proving.ADA.validADA_ofTitle3DisparateTreatment
    { coverage :=
        { disability := corr_disability h.disability
          placeOfPublicAccommodation := corr_t3_place h.accommodation
          ownsOperates := corr_t3_owns (d := gCE_pa pa) h.accommodation
          enjoymentContext := corr_t3_enjoyment h.denied }
      onBasis := corr_t3_onBasis h.causation }




































axiom gDPerson    : Deontic.ProtectedIndividual → Proving.ADA.Person
axiom gDCE        : Deontic.CoveredAddressee → Proving.ADA.CoveredEntity
axiom gDProg      : Deontic.CoveredAddressee → Proving.ADA.Program
axiom gDAct       : Deontic.CoveredAddressee → Deontic.ProtectedIndividual → Proving.ADA.Action

axiom corr_t3m_disability {i c} :
    Deontic.ConditionMet12182 i c → Proving.ADA.HasDisability (gDPerson i) (gComplaint c)
axiom corr_t3m_place {a c} :
    Deontic.AddresseeInClass12182 a c →
    Proving.ADA.IsPlaceOfPublicAccommodation (gDProg a) (gComplaint c)
axiom corr_t3m_owns {a c} :
    Deontic.AddresseeInClass12182 a c →
    Proving.ADA.OwnsLeasesOrOperates (gDCE a) (gDProg a) (gComplaint c)
axiom corr_t3m_enjoyment {a i c} :
    Deontic.ConditionMet12182 i c →
    Proving.ADA.ConcernsEnjoymentOfGoodsServices (gDAct a i) (gComplaint c)
axiom corr_t3m_needed {a i c} :
    ¬ Deontic.ModificationProvided12182b2 a i c →
    Proving.ADA.NeededReasonableModification (gDAct a i) (gDPerson i) (gComplaint c)
axiom corr_t3m_failed {a i c} :
    ¬ Deontic.ModificationProvided12182b2 a i c →
    Proving.ADA.FailedToMakeModification (gDAct a i) (gDPerson i) (gComplaint c)
axiom corr_t3m_notFundamental {a i c} :
    ¬ Deontic.FundamentalAlteration12182b2 a i c →
    Proving.ADA.ModificationNotFundamentalAlteration (gDAct a i) (gComplaint c)








theorem t3_modify_implies_golden
    {a i c}
    (h : Deontic.Obligation12182b2Breached a i c)
    : Proving.ADA.ValidADAComplaint (gDPerson i) (gDCE a) (gComplaint c) :=
  Proving.ADA.validADA_ofTitle3FailureToModify
    { coverage :=
        { disability := corr_t3m_disability h.1.condition
          placeOfPublicAccommodation := corr_t3m_place h.1.addressee
          ownsOperates := corr_t3m_owns h.1.addressee
          enjoymentContext := corr_t3m_enjoyment (a := a) h.1.condition }
      needed := corr_t3m_needed h.2
      notFundamental := corr_t3m_notFundamental h.1.noExcuse
      failed := corr_t3m_failed h.2 }

























axiom corr_ret_protected {p c} :
    Elements.EngagedInProtectedActivityADA p c →
    Proving.ADA.EngagedInProtectedActivity (gPerson p) (gComplaint c)
axiom corr_ret_causal {p c} :
    Elements.RetaliationCausalNexus p c →
    ∀ a, Proving.ADA.RetaliatoryCausation a (gPerson p) (gComplaint c)

axiom gAct_ret : Person → ComplaintText → Proving.ADA.Action


theorem retaliation_implies_golden_modulo_gaps
    {p c} (defendant : Proving.ADA.CoveredEntity)
    (h : Elements.Section12203 p c)
    (gap_retaliationDefendant :
      Proving.ADA.AdverseActionBy defendant (gAct_ret p c)
        (gPerson p) (gComplaint c))
    : Proving.ADA.ValidADAComplaint (gPerson p) defendant (gComplaint c) :=
  Proving.ADA.validADA_ofRetaliation
    { protectedAct := corr_ret_protected h.protectedActivity
      adverse := gap_retaliationDefendant
      causal := corr_ret_causal h.causation (gAct_ret p c) }

















theorem cand_implies_golden_modulo_gaps
    {p c}
    (defendant : Proving.ADA.CoveredEntity)
    (h : Elements.ValidADAClaim p c)
    (gap_retaliationDefendant :
      Proving.ADA.AdverseActionBy defendant (gAct_ret p c)
        (gPerson p) (gComplaint c))
    : ∃ (d : Proving.ADA.CoveredEntity),
        Proving.ADA.ValidADAComplaint (gPerson p) d (gComplaint c) := by
  cases h with
  | @titleI ce a hc =>
      exact ⟨_, t1_disparate_implies_golden hc⟩
  | titleIAccommodate hc => exact ⟨_, t1_accommodate_implies_golden hc⟩
  | titleII hc => exact ⟨_, t2_implies_golden hc⟩
  | titleIII hc => exact ⟨_, t3_disparate_implies_golden hc⟩
  | retaliation hc =>
      exact ⟨defendant,
        retaliation_implies_golden_modulo_gaps defendant hc gap_retaliationDefendant⟩

end Proving.USC.T42.ADA.GoldenBridge
