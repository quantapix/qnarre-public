










import Proving.Rehab504.Statute

namespace Proving.Rehab504



theorem rehab504Coverage_intro
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (hQualified          : IsQualifiedIndividualWithDisability plaintiff c)
    (hNotInstrumentality : NotAStateInstrumentality plaintiff c)
    (hRecipient          : IsRecipient defendant c)
    (hAssistedConducted  : FederallyAssistedOrConducted defendant c)
    (hProgramOf          : IsProgramOfRecipient pr defendant c)
    (hUnderProgram       : OccursUnderProgram a pr c)
    : Rehab504Coverage plaintiff defendant pr a c :=
  { qualifiedIndividual := hQualified
    notInstrumentality := hNotInstrumentality
    recipient := hRecipient
    assistedOrConducted := hAssistedConducted
    programOfRecipient := hProgramOf
    underProgram := hUnderProgram }



theorem intentionalDiscriminationClaim_intro
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (hCov    : Rehab504Coverage plaintiff defendant pr a c)
    (hDir    : ActionDirectedAtPerson a plaintiff c)
    (hSolely : SolelyByReasonOfDisability a g c)
    (hOff    : DefendantSuedInOfficialCapacity defendant c)
    : IntentionalDiscriminationClaim plaintiff defendant pr a g c :=
  { coverage := hCov
    directed := hDir
    solelyByReason := hSolely
    officialCap := hOff }

theorem failureToAccommodateClaim_intro
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (hCov    : Rehab504Coverage plaintiff defendant pr a c)
    (hNeeded : NeededReasonableAccommodation a plaintiff c)
    (hReas   : AccommodationReasonableNotFundamentalAlteration a c)
    (hDenied : RecipientDeniedMeaningfulAccess a plaintiff c)
    (hOff    : DefendantSuedInOfficialCapacity defendant c)
    : FailureToAccommodateClaim plaintiff defendant pr a c :=
  { coverage := hCov
    needed := hNeeded
    reasonable := hReas
    deniedAccess := hDenied
    officialCap := hOff }

theorem disparateImpactClaim_intro
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (hCov       : Rehab504Coverage plaintiff defendant pr a c)
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
    (hCov  : Rehab504Coverage plaintiff defendant pr a c)
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



theorem validRehab504_ofIntentional
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (h : IntentionalDiscriminationClaim plaintiff defendant pr a g c)
    : ValidRehab504Complaint plaintiff defendant c :=
  ValidRehab504Complaint.viaIntentional pr a g h

theorem validRehab504_ofFailureToAccommodate
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (h : FailureToAccommodateClaim plaintiff defendant pr a c)
    : ValidRehab504Complaint plaintiff defendant c :=
  ValidRehab504Complaint.viaFailureToAccommodate pr a h

theorem validRehab504_ofDisparateImpact
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (h : DisparateImpactClaim plaintiff defendant pr a g c)
    : ValidRehab504Complaint plaintiff defendant c :=
  ValidRehab504Complaint.viaDisparateImpact pr a g h

theorem validRehab504_ofRetaliation
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (h : RetaliationClaim plaintiff defendant pr a c)
    : ValidRehab504Complaint plaintiff defendant c :=
  ValidRehab504Complaint.viaRetaliation pr a h



theorem validRehab504Judicial_ofIntentional
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (h : IntentionalDiscriminationClaim plaintiff defendant pr a g c)
    : ValidRehab504JudicialClaim plaintiff defendant c :=
  ValidRehab504JudicialClaim.viaIntentional pr a g h

theorem validRehab504Judicial_ofFailureToAccommodate
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (h : FailureToAccommodateClaim plaintiff defendant pr a c)
    : ValidRehab504JudicialClaim plaintiff defendant c :=
  ValidRehab504JudicialClaim.viaFailureToAccommodate pr a h

theorem validRehab504Judicial_ofRetaliation
    {plaintiff : Person} {defendant : Recipient}
    {pr : Program} {a : Action} {c : ComplaintText}
    (h : RetaliationClaim plaintiff defendant pr a c)
    : ValidRehab504JudicialClaim plaintiff defendant c :=
  ValidRehab504JudicialClaim.viaRetaliation pr a h

end Proving.Rehab504
