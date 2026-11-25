













import Proving.Rico.Statute

namespace Proving.Rico






theorem section1962c_intro
    {p : Person} {e : Entity} {acts : List Act} {c : ComplaintText}
    (hCulp  : CulpablePersonCapableOfIntent p c)
    (hEnt   : IsEnterprise e c)
    (hICC   : EngagedInInterstateCommerce e c)
    (hDist  : PersonEnterpriseDistinct p e c)
    (hAssoc : EmployedOrAssociated p e c)
    (hCond  : ConductsOrParticipates p e c)
    (hPat   : PatternOfRacketeering acts c)
    : Section1962c p e acts c :=
  { culpable := hCulp
    enterprise := hEnt
    interstateCommerce := hICC
    distinct := hDist
    associated := hAssoc
    conducts := hCond
    pattern := hPat }


theorem validCivilRico1962c_intro
    {plaintiff defendant : Person} {e : Entity} {acts : List Act} {c : ComplaintText}
    (hViol : Section1962c defendant e acts c)
    (hInj  : BusinessOrPropertyInjury plaintiff c)
    (hCaus : ProximateCause plaintiff acts c)
    (hSOL  : WithinFourYearLimitationsPeriod plaintiff c)
    : ValidCivilRicoComplaint1962c plaintiff defendant e acts c :=
  { violation := hViol
    injury := hInj
    causation := hCaus
    timely := hSOL }



theorem section1962a_intro
    {p : Person} {e : Entity} {i : Investment} {acts : List Act} {c : ComplaintText}
    (hCulp : CulpablePersonCapableOfIntent p c)
    (hEnt  : IsEnterprise e c)
    (hICC  : EngagedInInterstateCommerce e c)
    (hPat  : PatternOfRacketeering acts c)
    (hDer  : DerivedFromPattern i acts c)
    (hInv  : InvestedInEnterprise p i e c)
    : Section1962a p e i acts c :=
  { culpable := hCulp
    enterprise := hEnt
    interstateCommerce := hICC
    pattern := hPat
    derived := hDer
    invested := hInv }

theorem validCivilRico1962a_intro
    {plaintiff defendant : Person} {e : Entity} {i : Investment}
    {acts : List Act} {c : ComplaintText}
    (hViol  : Section1962a defendant e i acts c)
    (hInj   : BusinessOrPropertyInjury plaintiff c)
    (hInvI  : InvestmentInjury plaintiff i c)
    (hSOL   : WithinFourYearLimitationsPeriod plaintiff c)
    : ValidCivilRicoComplaint1962a plaintiff defendant e i acts c :=
  { violation := hViol
    injury := hInj
    invInjury := hInvI
    timely := hSOL }



theorem section1962b_intro
    {p : Person} {e : Entity} {ic : InterestOrControl}
    {acts : List Act} {c : ComplaintText}
    (hCulp : CulpablePersonCapableOfIntent p c)
    (hEnt  : IsEnterprise e c)
    (hICC  : EngagedInInterstateCommerce e c)
    (hPat  : PatternOfRacketeering acts c)
    (hAcq  : AcquiredOrMaintainedControl p ic e c)
    (hThru : AcquisitionThroughPattern ic acts c)
    : Section1962b p e ic acts c :=
  { culpable := hCulp
    enterprise := hEnt
    interstateCommerce := hICC
    pattern := hPat
    acquired := hAcq
    throughPattern := hThru }

theorem validCivilRico1962b_intro
    {plaintiff defendant : Person} {e : Entity} {ic : InterestOrControl}
    {acts : List Act} {c : ComplaintText}
    (hViol : Section1962b defendant e ic acts c)
    (hInj  : BusinessOrPropertyInjury plaintiff c)
    (hAcqI : AcquisitionInjury plaintiff ic c)
    (hSOL  : WithinFourYearLimitationsPeriod plaintiff c)
    : ValidCivilRicoComplaint1962b plaintiff defendant e ic acts c :=
  { violation := hViol
    injury := hInj
    acqInjury := hAcqI
    timely := hSOL }



theorem section1962d_intro
    {p : Person} {ag : Agreement} {c : ComplaintText}
    (hCulp  : CulpablePersonCapableOfIntent p c)
    (hAgr   : AgreementToViolateRico p ag c)
    (hKnow  : KnowledgeOfRicoObjective p ag c)
    (hUnder : UnderlyingSubstantiveViolationContemplated ag c)
    : Section1962d p ag c :=
  { culpable := hCulp
    agreed := hAgr
    knew := hKnow
    underlying := hUnder }

theorem validCivilRico1962d_intro
    {plaintiff defendant : Person} {ag : Agreement} {c : ComplaintText}
    (hViol  : Section1962d defendant ag c)
    (hInj   : BusinessOrPropertyInjury plaintiff c)
    (hCaus  : InjuryByOvertActOfRacketeering plaintiff ag c)
    (hSOL   : WithinFourYearLimitationsPeriod plaintiff c)
    : ValidCivilRicoComplaint1962d plaintiff defendant ag c :=
  { violation := hViol
    injury := hInj
    causation := hCaus
    timely := hSOL }






theorem validCivilRico_ofC
    {plaintiff defendant : Person} {e : Entity} {acts : List Act} {c : ComplaintText}
    (h : ValidCivilRicoComplaint1962c plaintiff defendant e acts c)
    : ValidCivilRicoComplaint plaintiff defendant c :=
  ValidCivilRicoComplaint.viaSection1962c e acts h

theorem validCivilRico_ofA
    {plaintiff defendant : Person} {e : Entity} {i : Investment}
    {acts : List Act} {c : ComplaintText}
    (h : ValidCivilRicoComplaint1962a plaintiff defendant e i acts c)
    : ValidCivilRicoComplaint plaintiff defendant c :=
  ValidCivilRicoComplaint.viaSection1962a e i acts h

theorem validCivilRico_ofB
    {plaintiff defendant : Person} {e : Entity} {ic : InterestOrControl}
    {acts : List Act} {c : ComplaintText}
    (h : ValidCivilRicoComplaint1962b plaintiff defendant e ic acts c)
    : ValidCivilRicoComplaint plaintiff defendant c :=
  ValidCivilRicoComplaint.viaSection1962b e ic acts h

theorem validCivilRico_ofD
    {plaintiff defendant : Person} {ag : Agreement} {c : ComplaintText}
    (h : ValidCivilRicoComplaint1962d plaintiff defendant ag c)
    : ValidCivilRicoComplaint plaintiff defendant c :=
  ValidCivilRicoComplaint.viaSection1962d ag h

end Proving.Rico
