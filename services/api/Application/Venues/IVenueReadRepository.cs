using api.Domain.Venues;

namespace api.Application.Venues;

public interface IVenueReadRepository
{
    Task<IReadOnlyList<Venue>> GetTodayVenueCardsAsync(CancellationToken cancellationToken);
}
