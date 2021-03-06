//
// Copyright (C) 2013 Andras Varga
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program; if not, see <http://www.gnu.org/licenses/>.
//

package inet.examples.pim.iptv;

import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.inet.MulticastRouter;
import inet.node.inet.StandardHost;


//
// A generated network with grid topology.
//
network Network
{
    submodules:
        R00: MulticastRouter {
            @display("p=150,50");
            gates:
                ethg[4];
        }
        R01: MulticastRouter {
            @display("p=150,125");
            gates:
                ethg[4];
        }
        R02: MulticastRouter {
            @display("p=150,200");
            gates:
                ethg[4];
        }
        R03: MulticastRouter {
            @display("p=150,275");
            gates:
                ethg[4];
        }

        R10: MulticastRouter {
            @display("p=225,50");
            gates:
                ethg[4];
        }
        R11: MulticastRouter {
            @display("p=225,125");
            gates:
                ethg[4];
        }
        R12: MulticastRouter {
            @display("p=225,200");
            gates:
                ethg[4];
        }
        R13: MulticastRouter {
            @display("p=225,275");
            gates:
                ethg[4];
        }

        R20: MulticastRouter {
            @display("p=300,50");
            gates:
                ethg[4];
        }
        R21: MulticastRouter {
            @display("p=300,125");
            gates:
                ethg[4];
        }
        R22: MulticastRouter {
            @display("p=300,200");
            gates:
                ethg[4];
        }
        R23: MulticastRouter {
            @display("p=300,275");
            gates:
                ethg[4];
        }

        R30: MulticastRouter {
            @display("p=375,50");
            gates:
                ethg[4];
        }
        R31: MulticastRouter {
            @display("p=375,125");
            gates:
                ethg[4];
        }
        R32: MulticastRouter {
            @display("p=375,200");
            gates:
                ethg[4];
        }
        R33: MulticastRouter {
            @display("p=375,275");
            gates:
                ethg[4];
        }


        configurator: IPv4NetworkConfigurator {
            @display("p=513,50");
        }
        client: StandardHost {
            @display("p=493,275");
        }
        server: StandardHost {
            @display("p=48,50");
        }
    connections allowunconnected:
        R00.ethg[1] <--> Eth100M <--> R10.ethg[0];
        R00.ethg[3] <--> Eth100M <--> R01.ethg[2];
        R01.ethg[1] <--> Eth100M <--> R11.ethg[0];
        R01.ethg[3] <--> Eth100M <--> R02.ethg[2];
        R02.ethg[1] <--> Eth100M <--> R12.ethg[0];
        R02.ethg[3] <--> Eth100M <--> R03.ethg[2];
        R03.ethg[1] <--> Eth100M <--> R13.ethg[0];

        R10.ethg[1] <--> Eth100M <--> R20.ethg[0];
        R10.ethg[3] <--> Eth100M <--> R11.ethg[2];
        R11.ethg[1] <--> Eth100M <--> R21.ethg[0];
        R11.ethg[3] <--> Eth100M <--> R12.ethg[2];
        R12.ethg[1] <--> Eth100M <--> R22.ethg[0];
        R12.ethg[3] <--> Eth100M <--> R13.ethg[2];
        R13.ethg[1] <--> Eth100M <--> R23.ethg[0];

        R20.ethg[1] <--> Eth100M <--> R30.ethg[0];
        R20.ethg[3] <--> Eth100M <--> R21.ethg[2];
        R21.ethg[1] <--> Eth100M <--> R31.ethg[0];
        R21.ethg[3] <--> Eth100M <--> R22.ethg[2];
        R22.ethg[1] <--> Eth100M <--> R32.ethg[0];
        R22.ethg[3] <--> Eth100M <--> R23.ethg[2];
        R23.ethg[1] <--> Eth100M <--> R33.ethg[0];


        R30.ethg[3] <--> Eth100M <--> R31.ethg[2];

        R31.ethg[3] <--> Eth100M <--> R32.ethg[2];

        R32.ethg[3] <--> Eth100M <--> R33.ethg[2];


        server.ethg++ <--> Eth100M <--> R00.ethg[0];
        R33.ethg[1] <--> Eth100M <--> client.ethg++;
}
