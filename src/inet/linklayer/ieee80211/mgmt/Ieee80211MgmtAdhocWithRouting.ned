//
// Copyright (C) 2006 Andras Varga
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program; if not, see <http://www.gnu.org/licenses/>.
//


package inet.linklayer.ieee80211.mgmt;

//
// 802.11 management module used for ad-hoc mode.
// Relies on the MAC layer (~Ieee80211Mac) for reception and transmission of frames.
//
// This implementation never sends control or management frames, and discards
// any such frame received. Distributed beacon generation is not modelled.
// Only data frames are understood or sent at any time.
//
// This module never switches channels, that is, it will operate on the channel
// the physical layer is configured for (see channelNumber in ~Ieee80211Radio).
//
// @author Andras Varga
//
simple Ieee80211MgmtAdhocWithRouting like IIeee80211Mgmt
{
    parameters:
        string routingProtocol= default("inet.networklayer.manetrouting.OLSR");
        int frameCapacity = default(100);
        int maxTtl = default(32);
        bool EDCA = default(false); // enable Enhanced Distributed Channel Access (802.11e)
        // parameters for EDCA = true
        string classifier = default("Ieee80211eClassifier");
        string macModule;               // The path to the MAC module
        @macRouting;  // Mac layer with routing protocol working in the level 2
        @display("i=block/cogwheel");
        @signal[enqueuePk](type=cMessage);
        @signal[dequeuePk](type=cMessage);
        @signal[dropPkByQueue](type=cMessage);
        @signal[queueingTime](type=simtime_t; unit=s);
        @signal[dataQueueLen](type=long);  // number of stored packets
        @statistic[dataQueueLen](title="data queue length"; record=max,timeavg,vector; interpolationmode=sample-hold);
        @statistic[dropPkByQueue](title="packets dropped by queue"; source=dropPkByQueue; record=count,"sum(packetBytes)","vector(packetBytes)"; interpolationmode=none);
    gates:
        input upperLayerIn;
        output upperLayerOut;
        input macIn @labels(Ieee80211Frame);
        output macOut @labels(Ieee80211Frame);
        input agentIn @loose;   // unused dummy to statisfy the IIeee80211Mgmt interface
        output agentOut @loose; // unused dummy to statisfy the IIeee80211Mgmt interface
        input routingIn @loose;
        output routingOut @loose;
}
