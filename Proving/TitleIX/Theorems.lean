










import Proving.TitleIX.Statute

namespace Proving.TitleIX



theorem titleIXCoverage_intro
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (hPersonInUS         : IsPersonInUS plaintiff c)
    (hNotInstrumentality : NotAStateInstrumentality plaintiff c)
    (hRecipient          : IsRecipient defendant c)
    (hReceivesFFA        : ReceivesFederalFinancialAssistance defendant c)
    (hEducationProgram   : IsEducationProgramOfRecipient pr defendant c)
    (hUnderProgram       : OccursUnderProgram a pr c)
    (hNotExcepted        : NotWithinStatutoryException a pr c)
    : TitleIXCoverage plaintiff defendant pr a c :=
  { personInUS := hPersonInUS
    notInstrumentality := hNotInstrumentality
    recipient := hRecipient
    receivesFFA := hReceivesFFA
    educationProgram := hEducationProgram
    underProgram := hUnderProgram
    notExcepted := hNotExcepted }



theorem intentionalDiscriminationClaim_intro
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (hCov    : TitleIXCoverage plaintiff defendant pr a c)
    (hDir    : ActionDirectedAtPerson a plaintiff c)
    (hIntent : IntentionalDiscrimination a g c)
    (hOff    : DefendantSuedInOfficialCapacity defendant c)
    : IntentionalDiscriminationClaim plaintiff defendant pr a g c :=
  { coverage := hCov
    directed := hDir
    intentional := hIntent
    officialCap := hOff }

theorem disparateImpactClaim_intro
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (hCov         : TitleIXCoverage plaintiff defendant pr a c)
    (hNeutral     : IsFaciallyNeutralPolicy a c)
    (hImpact      : AdverseDisparateImpact a g c)
    (hCausal      : CausalLinkBetweenPolicyAndImpact a c)
    (hLacksJust   : LacksSubstantialLegitimateJustification a c)
    : DisparateImpactClaim plaintiff defendant pr a g c :=
  { coverage := hCov
    facialNeutrality := hNeutral
    adverseImpact := hImpact
    causalLink := hCausal
    lacksJustification := hLacksJust }

theorem retaliationClaim_intro
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (hCov   : TitleIXCoverage plaintiff defendant pr a c)
    (hProt  : ProtectedActivity plaintiff c)
    (hAdv   : AdverseAction a plaintiff c)
    (hCaus  : RetaliatoryCausation a plaintiff c)
    (hOff   : DefendantSuedInOfficialCapacity defendant c)
    : RetaliationClaim plaintiff defendant pr a c :=
  { coverage := hCov
    protectedAct := hProt
    adverse := hAdv
    causal := hCaus
    officialCap := hOff }

theorem deliberateIndifferenceClaim_intro
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (hCov     : TitleIXCoverage plaintiff defendant pr a c)
    (hHarass  : SexualHarassmentSevereePervasive a plaintiff c)
    (hKnow    : RecipientHadActualKnowledge a c)
    (hIndiff  : DeliberateIndifference a c)
    (hControl : SubstantialControlOverHarasserAndContext a c)
    (hOff     : DefendantSuedInOfficialCapacity defendant c)
    : DeliberateIndifferenceClaim plaintiff defendant pr a c :=
  { coverage := hCov
    harassment := hHarass
    actualKnowledge := hKnow
    indifference := hIndiff
    control := hControl
    officialCap := hOff }



theorem validTitleIX_ofIntentional
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (h : IntentionalDiscriminationClaim plaintiff defendant pr a g c)
    : ValidTitleIXComplaint plaintiff defendant c :=
  ValidTitleIXComplaint.viaIntentional pr a g h

theorem validTitleIX_ofDisparateImpact
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (h : DisparateImpactClaim plaintiff defendant pr a g c)
    : ValidTitleIXComplaint plaintiff defendant c :=
  ValidTitleIXComplaint.viaDisparateImpact pr a g h

theorem validTitleIX_ofRetaliation
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (h : RetaliationClaim plaintiff defendant pr a c)
    : ValidTitleIXComplaint plaintiff defendant c :=
  ValidTitleIXComplaint.viaRetaliation pr a h

theorem validTitleIX_ofDeliberateIndifference
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (h : DeliberateIndifferenceClaim plaintiff defendant pr a c)
    : ValidTitleIXComplaint plaintiff defendant c :=
  ValidTitleIXComplaint.viaDeliberateIndifference pr a h



theorem validTitleIXJudicial_ofIntentional
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (h : IntentionalDiscriminationClaim plaintiff defendant pr a g c)
    : ValidTitleIXJudicialClaim plaintiff defendant c :=
  ValidTitleIXJudicialClaim.viaIntentional pr a g h

theorem validTitleIXJudicial_ofRetaliation
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (h : RetaliationClaim plaintiff defendant pr a c)
    : ValidTitleIXJudicialClaim plaintiff defendant c :=
  ValidTitleIXJudicialClaim.viaRetaliation pr a h

theorem validTitleIXJudicial_ofDeliberateIndifference
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (h : DeliberateIndifferenceClaim plaintiff defendant pr a c)
    : ValidTitleIXJudicialClaim plaintiff defendant c :=
  ValidTitleIXJudicialClaim.viaDeliberateIndifference pr a h

end Proving.TitleIX
