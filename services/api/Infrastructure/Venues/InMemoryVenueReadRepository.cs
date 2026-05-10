using api.Application.Venues;
using api.Domain.Venues;

namespace api.Infrastructure.Venues;

public sealed class InMemoryVenueReadRepository : IVenueReadRepository
{
    private static readonly IReadOnlyList<Venue> VenueCards = new List<Venue>
    {
        new(
            Guid.Parse("2a2606fc-51ce-40d1-9545-e8bba2a87015"),
            "Merkez Spor Tesisleri",
            "Alacasuluk Mah. 100. Yil Bulvari, Karaman",
            "Suni Cim",
            "Kapali Saha",
            new List<string> { "19:00", "20:00", "21:00", "22:30" }
        ),
        new(
            Guid.Parse("31416a3a-7f86-407a-af0b-19f252488be6"),
            "Karaman Arena",
            "Universite Yolu Uzeri, 5. Km, Karaman",
            "Akrilik Kaplama",
            "Kapali Saha",
            new List<string> { "23:00" }
        )
    };

    public Task<IReadOnlyList<Venue>> GetTodayVenueCardsAsync(CancellationToken cancellationToken)
    {
        return Task.FromResult(VenueCards);
    }
}
