class DiscoverChallengeModule {
  final String? challengeName;
  final bool? isSponsorEvent;
  final String? challengePhotoLeft;
  final String? challengePhotoRight;
  final String? numberOfChallenge;
  final String? sponsorEventHeaderPhoto;
  final String? category;

  const DiscoverChallengeModule(
      {required this.challengeName,
      required this.isSponsorEvent,
      this.challengePhotoLeft,
      this.challengePhotoRight,
      this.numberOfChallenge,
      this.sponsorEventHeaderPhoto,
      required this.category});
}
