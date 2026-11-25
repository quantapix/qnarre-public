










import Proving.AgeAct.Statute

namespace Proving.AgeAct



theorem ageActCoverage_intro
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (hPersonInUS         : IsPersonInUS plaintiff c)
    (hNotInstrumentality : NotAStateInstrumentality plaintiff c)
    (hRecipient          : IsRecipient defendant c)
    (hReceivesFFA        : ReceivesFederalFinancialAssistance defendant c)
    (hProgramOf          : IsProgramOfRecipient pr defendant c)
    (hUnderProgram       : OccursUnderProgram a pr c)
    (hOutsideExceptions  : OutsideAgeActExceptions a pr c)
    : AgeActCoverage plaintiff defendant pr a c :=
  { personInUS := hPersonInUS
    notInstrumentality := hNotInstrumentality
    recipient := hRecipient
    receivesFFA := hReceivesFFA
    programOfRecipient := hProgramOf
    underProgram := hUnderProgram
    outsideExceptions := hOutsideExceptions }



theorem intentionalDiscriminationClaim_intro
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (hCov    : AgeActCoverage plaintiff defendant pr a c)
    (hDir    : ActionDirectedAtPerson a plaintiff c)
    (hIntent : IntentionalAgeDiscrimination a g c)
    (hOff    : DefendantSuedInOfficialCapacity defendant c)
    : IntentionalDiscriminationClaim plaintiff defendant pr a g c :=
  { coverage := hCov
    directed := hDir
    intentional := hIntent
    officialCap := hOff }

theorem disparateImpactClaim_intro
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (hCov       : AgeActCoverage plaintiff defendant pr a c)
    (hNeutral   : IsFaciallyNeutralPolicy a c)
    (hImpact    : AdverseDisparateImpact a g c)
    (hCausal    : CausalLinkBetweenPolicyAndImpact a c)
    (hLacksJust : LacksSubstantialLegitimateJustification a c)
    : DisparateImpactClaim plaintiff defendant pr a g c :=
  { coverage := hCov
    facialNeutrality := hNeutral
    adverseImpact := hImpact
    causalLink := hCausal
    lacksJustification := hLacksJust }

theorem retaliationClaim_intro
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (hCov  : AgeActCoverage plaintiff defendant pr a c)
    (hProt : ProtectedActivity plaintiff c)
    (hAdv  : AdverseAction a plaintiff c)
    (hCaus : RetaliatoryCausation a plaintiff c)
    (hOff  : DefendantSuedInOfficialCapacity defendant c)
    : RetaliationClaim plaintiff defendant pr a c :=
  { coverage := hCov
    protectedAct := hProt
    adverse := hAdv
    causal := hCaus
    officialCap := hOff }



theorem validAgeAct_ofIntentional
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (h : IntentionalDiscriminationClaim plaintiff defendant pr a g c)
    : ValidAgeActComplaint plaintiff defendant c :=
  ValidAgeActComplaint.viaIntentional pr a g h

theorem validAgeAct_ofDisparateImpact
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (h : DisparateImpactClaim plaintiff defendant pr a g c)
    : ValidAgeActComplaint plaintiff defendant c :=
  ValidAgeActComplaint.viaDisparateImpact pr a g h

theorem validAgeAct_ofRetaliation
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (h : RetaliationClaim plaintiff defendant pr a c)
    : ValidAgeActComplaint plaintiff defendant c :=
  ValidAgeActComplaint.viaRetaliation pr a h



theorem validAgeActJudicial_ofIntentional
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (h : IntentionalDiscriminationClaim plaintiff defendant pr a g c)
    : ValidAgeActJudicialClaim plaintiff defendant c :=
  ValidAgeActJudicialClaim.viaIntentional pr a g h

theorem validAgeActJudicial_ofRetaliation
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (h : RetaliationClaim plaintiff defendant pr a c)
    : ValidAgeActJudicialClaim plaintiff defendant c :=
  ValidAgeActJudicialClaim.viaRetaliation pr a h

end Proving.AgeAct
