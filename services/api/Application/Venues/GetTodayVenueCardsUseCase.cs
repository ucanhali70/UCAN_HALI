namespace api.Application.Venues;

public sealed class GetTodayVenueCardsUseCase
{
    private readonly IVenueReadRepository _venueReadRepository;

    public GetTodayVenueCardsUseCase(IVenueReadRepository venueReadRepository)
    {
        _venueReadRepository = venueReadRepository;
    }

    public async Task<IReadOnlyList<VenueCardDto>> ExecuteAsync(CancellationToken cancellationToken)
    {
        var venues = await _venueReadRepository.GetTodayVenueCardsAsync(cancellationToken);

        return venues
            .Select(venue => new VenueCardDto(
                venue.Id,
                venue.Name,
                venue.Address,
                venue.GroundType,
                venue.PitchType,
                venue.AvailableSlots
            ))
            .ToList();
    }
}
