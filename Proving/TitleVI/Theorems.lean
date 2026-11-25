










import Proving.TitleVI.Statute

namespace Proving.TitleVI



theorem titleVICoverage_intro
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (hPersonInUS         : IsPersonInUS plaintiff c)
    (hNotInstrumentality : NotAStateInstrumentality plaintiff c)
    (hRecipient          : IsRecipient defendant c)
    (hReceivesFFA        : ReceivesFederalFinancialAssistance defendant c)
    (hProgramOfRecipient : IsProgramOfRecipient pr defendant c)
    (hUnderProgram       : OccursUnderProgram a pr c)
    : TitleVICoverage plaintiff defendant pr a c :=
  { personInUS := hPersonInUS
    notInstrumentality := hNotInstrumentality
    recipient := hRecipient
    receivesFFA := hReceivesFFA
    programOfRecipient := hProgramOfRecipient
    underProgram := hUnderProgram }



theorem intentionalDiscriminationClaim_intro
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (hCov    : TitleVICoverage plaintiff defendant pr a c)
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
    (hCov         : TitleVICoverage plaintiff defendant pr a c)
    (hNeutral     : IsFaciallyNeutralPolicy a c)
    (hImpact      : AdverseDisparateImpact a g c)
    (hCausal      : CausalLinkBetweenPolicyAndImpact a c)
    (hLacksJust   : LacksSubstantialLegitimateJustification a c)
    : DisparateImpactClaim plaintiff defendant pr a g c :=
  { coverage := hCov
    facialNeutrality := hNeutral
    adverseImpact := hImpact
    causalLink := hCausal
    justificationDefeated := .lacksJustification hLacksJust }







theorem disparateImpactClaim_ofLessDiscriminatoryAlternative
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (hCov         : TitleVICoverage plaintiff defendant pr a c)
    (hNeutral     : IsFaciallyNeutralPolicy a c)
    (hImpact      : AdverseDisparateImpact a g c)
    (hCausal      : CausalLinkBetweenPolicyAndImpact a c)
    (hLDA         : LessDiscriminatoryAlternativeAvailable a c)
    : DisparateImpactClaim plaintiff defendant pr a g c :=
  { coverage := hCov
    facialNeutrality := hNeutral
    adverseImpact := hImpact
    causalLink := hCausal
    justificationDefeated := .lessDiscriminatoryAlternative hLDA }

theorem retaliationClaim_intro
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (hCov   : TitleVICoverage plaintiff defendant pr a c)
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



theorem validTitleVI_ofIntentional
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (h : IntentionalDiscriminationClaim plaintiff defendant pr a g c)
    : ValidTitleVIComplaint plaintiff defendant c :=
  ValidTitleVIComplaint.viaIntentional pr a g h

theorem validTitleVI_ofDisparateImpact
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (h : DisparateImpactClaim plaintiff defendant pr a g c)
    : ValidTitleVIComplaint plaintiff defendant c :=
  ValidTitleVIComplaint.viaDisparateImpact pr a g h

theorem validTitleVI_ofRetaliation
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (h : RetaliationClaim plaintiff defendant pr a c)
    : ValidTitleVIComplaint plaintiff defendant c :=
  ValidTitleVIComplaint.viaRetaliation pr a h



theorem validTitleVIJudicial_ofIntentional
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (h : IntentionalDiscriminationClaim plaintiff defendant pr a g c)
    : ValidTitleVIJudicialClaim plaintiff defendant c :=
  ValidTitleVIJudicialClaim.viaIntentional pr a g h

theorem validTitleVIJudicial_ofRetaliation
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (h : RetaliationClaim plaintiff defendant pr a c)
    : ValidTitleVIJudicialClaim plaintiff defendant c :=
  ValidTitleVIJudicialClaim.viaRetaliation pr a h

end Proving.TitleVI
